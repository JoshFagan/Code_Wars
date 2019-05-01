using System;

namespace Kyu_6
{
    public class Carboat
    {

        public static void Main(string[] args)
        {
            // [["M: 37", "B: 5", "C: 4"], ["M: 100", "B: 14", "C: 11"]]
            Console.WriteLine(howmuch(1, 100));

            // [["M: 1045", "B: 149", "C: 116"]]
            Console.WriteLine(howmuch(1000, 1100));

            // [["M: 9991", "B: 1427", "C: 1110"]]
            Console.WriteLine(howmuch(10000, 9950));

            // [["M: 37", "B: 5", "C: 4"], ["M: 100", "B: 14", "C: 11"], ["M: 163", "B: 23", "C: 18"]]
            Console.WriteLine(howmuch(0, 200));
        }

        public static string howmuch(int m, int n)
        {
            string solution = "";

            /*
             * Naive Approach: Test each possible answer
             * 
             *   Iterate i from m to n
             *     Test i % 9 == 1
             *       Test i % 7 == 2       
             */
            for (int i = Math.Min(m, n); i <= Math.Max(m, n); i++)
            {
                // Cars
                if ((i % 9 == 1) && (i % 7 == 2))
                {
                    solution += $"[M: {i} B: {i / 7} C: {i / 9}]";
                }
            }

            return $"[{solution}]";
        }
    }
}