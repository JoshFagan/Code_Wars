using System;
using System.Text.RegularExpressions;

namespace Kyu_7
{
    class DisemvowelTrolls
    {
        static void Main(string[] args)
        {
            string str = "";
            // Test Cases:
            // "This website is for losers LOL!" would become "Ths wbst s fr lsrs LL!".
            str = "This website is for losers LOL!";
            Console.WriteLine(Disemvowel(str));
        }

        /* 
         *  Takes a string and returns a new string with all vowels removed. 
         */
        public static string NiaveDisemvowel(string str)
        {
            int index;

            char[] vowels = new char[] { 'a', 'A', 
                                         'e', 'E',
                                         'i', 'I',
                                         'o', 'O',
                                         'u', 'U' };
             
            for (int i = 0; i < str.Length; i++)
            {
                index = str.IndexOfAny(vowels);
                if (index < 0)
                {
                    break;
                }
                str = str.Remove(index, 1);
            }

            return str;
        }

        public static string Disemvowel(string str)
        {
            return Regex.Replace(str, "[aeiou]", "", RegexOptions.IgnoreCase);
        }
    }
}
