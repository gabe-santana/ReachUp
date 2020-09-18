using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Newtonsoft.Json.Serialization;
using Newtonsoft;
using Newtonsoft.Json.Converters;


namespace ReachUpWebAPI.MapModels
{

    public class Map
    {
        public Map()
        {
            FetchLocalPosition(" 'clients': [ {'id':'1452','name':'Joaquim Barbosa'}, {'id':'065','name':'Monica Bergammoto'} ] ");
        }

        //string paramJson = " 'clients': [ {'id':'1452','name':'Joaquim Barbosa'}, {'id':'065','name':'Monica Bergammoto'} ] ";
   

        public void FetchLocalPosition(string Json)
        {
            object localPosition = Newtonsoft.Json.JsonConvert.DeserializeObject(Json);

            Console.WriteLine(localPosition);

            //Parsionar Json e pegar posição do local 
            //return new Position();
        }

        public Task<object> BreedRoute(Position POrigin, Position PDestiny, string Json)
        {
            //Fazer a deserialização do Json

            //Pego só o que eu quero (andares), o resto jogo no lixo

            //Determinar a quantidade de etapas de deslocamento, importante para os loops

            int stepsCount = 1;

            /*Para cada etapa, ver as possibilidades válidas e logo após a mais curta entre as válidas*/

            object[,] possibleStepRoutes = new object[,] { };
            object[] bestStepRoute = new object[] { };

            for (int stp = 0; stp < stepsCount; stp++)//Analisar cada etapa
            {
                //Armazenar as rotas possíveis da etapa: pendente

                bestStepRoute[stp] = possibleStepRoutes[stp, 0];//Considerar a primeira como a mais curta

                for (int pr = 1; pr < possibleStepRoutes.GetLength(stp); pr++)//Analisar as outras rotas possíveis
                {
                    if (possibleStepRoutes[stp,pr].ToString().LongCount() < bestStepRoute[stp].ToString().LongCount())//A quantidade de mini-steps é menor que a da rota mais curta?
                    {
                        bestStepRoute[stp] = possibleStepRoutes[stp, pr];//Se for, transformá-la na rota mais curta
                    }
                }

                for (int i = 0; i < possibleStepRoutes.GetLength(stp); i++)//Após saber a rota mais curta da etapa, apagar suas rotas possíveis
                {
                    possibleStepRoutes[stp, i] = null;
                }

            }

            //Formar a melhor rota, juntando as melhores possibilidades de cada etapa

            object[,] bestRoute = new object[,] {};
            
            /*Pensar em como tratar as etapas intermediárias (elevadores, escada-rolantes)*/

            for (int i = 0; i < bestStepRoute.Length; i++)
            {
                //Concatenar as etapas
            }


            //Fazer a serialização da rota em Json


            //Parsionar Json e pegar a menor rota possível 
            return Task.FromResult(new object {});

        }

        //Destructor Method
        ~Map()
        {
            return;//Implementar
        }
    }
}
