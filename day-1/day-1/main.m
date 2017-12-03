//
//  main.m
//  day-1
//
//  Created by Morgan Wowk on 2017-12-02.
//  Copyright © 2017 Morgan Wowk. All rights reserved.
//
#import <stdio.h>
#import <string.h>
#define BUZZ_SIZE 5000

char * readSampleInput(){
    char* buff = malloc(BUZZ_SIZE);
    FILE *f = fopen("/Users/morganwowk/Documents/github/advent-of-code-2017/day-1/day-1/input.txt", "r");
    fgets(buff, BUZZ_SIZE, f);
    fclose(f);
    return buff;
}

void part_one(char* input){
    
    char*   character;
    int     sum = 0,
            previousDigit = -1,
            firstDigit = *input - '0';
    
    for (character = input; *character != '\0'; character++){
        int characterValue = *character - '0';
        if(characterValue == previousDigit){
            sum += characterValue;
        }
        if(strlen(character) == 1 && characterValue == firstDigit){
            sum += characterValue;
        }
        previousDigit = characterValue;
    }
    
    printf("Sum total part one: %d\n", sum);
}

void part_two(char* input){
    
    char*       character;
    const int   NUM_DIGITS = (int)strlen(input),
                HALF_STEP = NUM_DIGITS / 2;
    int         sum = 0,
                i = 0;
    
    for (character = input; *character != '\0'; character++){
        
        int cv = *character - '0';
        int oi = i + HALF_STEP - (NUM_DIGITS / 2 <= i?NUM_DIGITS:0);
        int ocv = input[oi] - '0';
        
        if(cv == ocv){
            sum += cv;
        }
        i++;
    }
    
    printf("Sum total part two: %d\n", sum);
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        char* input = readSampleInput();
        part_one(input);
        part_two(input);

        return 0;
        
    }
}
