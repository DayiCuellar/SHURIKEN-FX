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
//|      Entradas de valores
//+------------------------------------------------------------------+
input string Parametros_Operaciones = "--------------------- Parametros_Operaciones";
extern double PIPS_SL = 15;
extern double PIPS_TP = 5;
extern double Lotaje = 0.01;
input int num_mag = 0;
input string Parametros_Indicador = "--------------------- Parametros_Indicador";
extern int SignalPeriod =12;
extern int ArrowPeriod = 2;
extern int SL_pips = 100;
extern bool AlertON = true;
extern bool Email = true;

//+------------------------------------------------------------------+
//|                         Variables Globales
//+------------------------------------------------------------------+
ENUM_DIR  direccion = nada;
double flecha_up = 0,
       flecha_down = 0;
       
//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit()
{
//---
   flecha_up = iCustom(_Symbol,PERIOD_CURRENT,"IVT_High_Low_Map_ (1)", SignalPeriod, ArrowPeriod, SL_pips, AlertON, Email,3,0);
   flecha_down = iCustom(_Symbol,PERIOD_CURRENT,"IVT_High_Low_Map_ (1)", SignalPeriod, ArrowPeriod, SL_pips, AlertON, Email,4,0);
   

//---
   return(INIT_SUCCEEDED);
}
//+------------------------------------------------------------------+
//| Expert deinitialization function                                 |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
{
//---
   if(_UninitReason != 3 && _UninitReason != 5) //Lo que quiero que haga solo una vez
   {
//---Parametros iniciales de Operaciones
      op.Set_Numero_Magico(num_mag);
//---
   }
}   
//+------------------------------------------------------------------+
//| Expert tick function                                             |
//+------------------------------------------------------------------+
   void OnTick()
   {
//---
   }// FIN DEL ONTICK
//+------------------------------------------------------------------+
   
