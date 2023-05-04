//+------------------------------------------------------------------+
//|                                                  SHURIKEN FX.mq4 |
//|                                                      SHURIKEN FX |
//|                                                                  |
//+------------------------------------------------------------------+
#property copyright "SHURIKEN FX"
#property link      ""
#property version   "1.00"
#property strict
//+------------------------------------------------------------------+
//| defines                                                          |
//+------------------------------------------------------------------+
#define  ESPERA  250
//+------------------------------------------------------------------+
//| Includes                                                         |
//+------------------------------------------------------------------+
#include <Robapips\Chivos.mqh>
#include <Robapips\Objetos.mqh>
#include <Robapips\Operaciones.mqh>
#include <Robapips\Velas.mqh>
#include <Robapips\DEFINES.mqh>
Operaciones op;
Velas vv;
//+------------------------------------------------------------------+
//|      ENUM                                                        |
//+------------------------------------------------------------------+

enum ENUM_MODO
{
   Automatico,
   Manual,
};
enum ENUM_DIR
{
   nada,
   buy,
   sell,
};
//+------------------------------------------------------------------+
//|                  ENTRADAS DE VALORES
//+------------------------------------------------------------------+
input string Parametros_Operaciones = "--------------------- Parametros_Operaciones";
extern double PIPS_SL = 15;
extern double PIPS_TP = 5;
extern double Lotaje = 0.01;
input int num_mag = 0;
input string Parametros_Indicador = "--------------------- Parametros_Indicador";
extern int SignalPeriod = 12;
extern int ArrowPeriod = 2;
extern int SL_pips = 100;
extern bool AlertON = true;
extern bool Email = true;

//+------------------------------------------------------------------+
//|                   VARIABLES GLOBALES
//+------------------------------------------------------------------+
ENUM_DIR  direccion = nada;
double flecha_up = 0,
       flecha_down = 0;
bool parametros_input = false;       

//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit()
{
//---
   if(_UninitReason != 3 && _UninitReason != 5) //Lo que quiero que haga solo una vez
   {
//---Parametros iniciales de Operaciones
      op.Set_Numero_Magico(num_mag);
//---
   }
   return(INIT_SUCCEEDED);
}
//+------------------------------------------------------------------+
//| Expert deinitialization function                                 |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
{
//---
   if(_UninitReason != 3 && _UninitReason != 5 && !IsVisualMode())
   {
      Print("Eliminar objetos");
      ObjectsDeleteAll();
   }
   if(_UninitReason == 5)
      parametros_input = true;
//---
}
//+------------------------------------------------------------------+
//| Expert tick function                                             |
//+------------------------------------------------------------------+
void OnTick()
{
//+------------------------------------------------------------------+
//|          ALMACENAR LOS VALORES DEL INDICADOR
//+------------------------------------------------------------------+
   flecha_up = iCustom(_Symbol, PERIOD_CURRENT, "IVT_High_Low_Map_ (1)", SignalPeriod, ArrowPeriod, SL_pips, AlertON, Email, 3, 0);
   flecha_down = iCustom(_Symbol, PERIOD_CURRENT, "IVT_High_Low_Map_ (1)", SignalPeriod, ArrowPeriod, SL_pips, AlertON, Email, 4, 0);
//+------------------------------------------------------------------+
//|     DETERMINAR LA DIRECCION DE LA OPERACIÓN
//+------------------------------------------------------------------+
   if(flecha_up > -1 && flecha_up != 0)
   {
      direccion = buy;
   }
   if(flecha_down > -1 && flecha_down != 0)
   {
      direccion = sell;
   }
//+------------------------------------------------------------------+
//|               APERTURA DE LAS OPERACIONES
//+------------------------------------------------------------------+
   if(direccion == buy)
   {
      op.Abrir_BUY_a_Mercado(Lotaje, Convertir_de_ticks_a_Precio_Stop_Loss((int) PIPS_SL * 10, OP_BUY, Ask), Convertir_de_ticks_a_Precio_Take_Profit((int)PIPS_TP * 10, OP_BUY, Ask));
      direccion = nada;
   }
   if(direccion == sell)
   {
      op.Abrir_SELL_a_Mercado(Lotaje, Convertir_de_ticks_a_Precio_Stop_Loss((int) PIPS_SL * 10, OP_BUY, Bid), Convertir_de_ticks_a_Precio_Take_Profit((int)PIPS_TP * 10, OP_SELL, Bid));
      direccion = nada;
   }
}// FIN DEL ONTICK
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
