//
//  main.m
//  appCalculadora
//
//  Created by Jorge Cisneros de la Torre on 18/02/24.
//

#import <Foundation/Foundation.h>
#import "Operaciones.h"

#include <iostream>
using namespace std;

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Operaciones *op = [[Operaciones alloc]init];
        
        double n1, n2, factorial;
        
        NSNumber *suma, *resta, *mult, *div;
        NSNumber *a, *b;
        BOOL primo;
        int selector = 1, residuo;
        char salir = 'n';
        while ( salir != 'S' && salir != 's' ) {
            cout << "🤓☝️ Bienvenido a la calculadora 🤓☝️\n";
            cout << "Seleccione una de las siguientes opciones 1️⃣ - 7️⃣: \n";
            cout << "1️⃣ .- Suma \n" << "2️⃣ .- Resta \n" << "3️⃣ .- Multiplicación \n"
                 << "4️⃣ .- Divisón \n" << "5️⃣ .- Residuo \n" << "6️⃣ .- Factorial \n"
                 << "7️⃣ .- Conocer si un número es primo \n";
            cin >> selector;
            
            switch (selector) {
                case 1:
                    printf("Al número: ");
                    scanf("%lf", &n1);
                    printf("sumale: ");
                    scanf("%lf", &n2);
                    
                    a = [NSNumber numberWithDouble:n1];
                    b = [NSNumber numberWithDouble:n2];
                    
                    suma = [op suma:a mas:b];
                    
                    printf("🤖 EL RESULTADO ES 👾\n");
                    printf("%.2lf ➕ %.2lf = %.4lf\n", [a doubleValue], [b doubleValue], [suma doubleValue]);
                    
                    cout << "Desea salir de la calculadora? (S/N)" << endl;
                    cin >> salir;
                    break;
                case 2:
                    printf("Al número: ");
                    scanf("%lf", &n1);
                    printf("restale: ");
                    scanf("%lf", &n2);
                    
                    a = [NSNumber numberWithDouble:n1];
                    b = [NSNumber numberWithDouble:n2];
                    
                    resta = [op resta:a menos:b];
                    
                    printf("🤖 EL RESULTADO ES 👾\n");
                    printf("%.2lf ➖ %.2lf = %.4lf\n", [a doubleValue], [b doubleValue], [resta doubleValue]);
                    
                    cout << "Desea salir de la calculadora? (S/N)" << endl;
                    cin >> salir;
                    break;
                case 3:
                    printf("Al número: ");
                    scanf("%lf", &n1);
                    printf("multiplicalo por: ");
                    scanf("%lf", &n2);
                    
                    a = [NSNumber numberWithDouble:n1];
                    b = [NSNumber numberWithDouble:n2];
                    
                    mult = [op multiplica:a por:b];
                    
                    printf("🤖 EL RESULTADO ES 👾\n");
                    printf("%.2lf ✖️ %.2lf = %.4lf\n", [a doubleValue], [b doubleValue], [mult doubleValue]);
                    
                    cout << "Desea salir de la calculadora? (S/N)" << endl;
                    cin >> salir;
                    break;
                case 4:
                    printf("Al número: ");
                    scanf("%lf", &n1);
                    printf("dividelo entre: ");
                    scanf("%lf", &n2);
                    
                    a = [NSNumber numberWithDouble:n1];
                    b = [NSNumber numberWithDouble:n2];
                    
                    div = [op divide:a entre:b];
                    
                    printf("🤖 EL RESULTADO ES 👾\n");
                    printf("%.2lf ➗ %.2lf = %.4lf\n", [a doubleValue], [b doubleValue], [mult doubleValue]);
                    
                    cout << "Desea salir de la calculadora? (S/N)" << endl;
                    cin >> salir;
                    break;
                case 5:
                    cout << "Calcula el residuo de: ";
                    cin >> n1;
                    
                    cout << "Entre: ";
                    cin >> n2;
                    
                    residuo = [op obtenResiduo:n1 entre:n2];
                    
                    printf("🤖 EL RESULTADO ES 👾\n");
                    printf("%.1lf ⁒ %.1lf = %d\n", n1, n2, residuo);
                    
                    cout << "Desea salir de la calculadora? (S/N)" << endl;
                    cin >> salir;
                    break;
                case 6:
                    cout << "👽 Calcula el factorial de: ";
                    cin >> n1;
                    
                    factorial = [op factorial:n1];
                    
                    cout << "El factorial de " << n1 << " es 💩: " << factorial << endl;
                    
                    cout << "Desea salir de la calculadora? (S/N)" << endl;
                    cin >> salir;
                    break;
                case 7:
                    
                    cout << "Qué número quieres saber si es primo: ";
                    cin >> n1;
                    
                    primo = [op esPrimo:n1];
                    
                    if ( primo ) {
                        cout << "El número " << n1 << " es primo 👍 " << endl;
                    } else {
                        cout << "El número " << n1 << " no es primo 👎 " << endl;
                    }
                    
                    cout << "Desea salir de la calculadora? (S/N)" << endl;
                    cin >> salir;
                    break;
                default:
                    printf("Por favor elija un número del 1 - 7\n");
                    break;
            }
        }
    }
    return 0;
}
