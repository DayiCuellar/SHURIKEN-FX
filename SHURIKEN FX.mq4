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
//+------------------------------------------------------------------+
//|                         Variables Globales
//+------------------------------------------------------------------+
ENUM_DIR  direccion = nada;
//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit()
{
//---
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
   
