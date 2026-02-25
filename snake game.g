#include <stdio.h>
#include <stdlib.h>
#include <time.h>

#define WIDTH 20
#define HEIGHT 20

int x, y, fruitX, fruitY, score;
int gameOver;

void setup()
{
    gameOver = 0;
    x = WIDTH / 2;
    y = HEIGHT / 2;
    srand(time(0));
    fruitX = rand() % WIDTH;
    fruitY = rand() % HEIGHT;
    score = 0;
}

void draw()
{
    system("clear");   // use "cls" if Windows

    for (int i = 0; i < WIDTH + 2; i++)
        printf("#");
    printf("\n");

    for (int i = 0; i < HEIGHT; i++)
    {
        for (int j = 0; j < WIDTH; j++)
        {
            if (j == 0)
                printf("#");

            if (i == y && j == x)
                printf("O");
            else if (i == fruitY && j == fruitX)
                printf("F");
            else
                printf(" ");

            if (j == WIDTH - 1)
                printf("#");
        }
        printf("\n");
    }

    for (int i = 0; i < WIDTH + 2; i++)
        printf("#");

    printf("\nScore: %d\n", score);
    printf("Use W A S D to move. X to exit\n");
}

void input()
{
    char ch;
    scanf(" %c", &ch);

    switch (ch)
    {
        case 'a': x--; break;
        case 'd': x++; break;
        case 'w': y--; break;
        case 's': y++; break;
        case 'x': gameOver = 1; break;
    }
}

void logic()
{
    if (x >= WIDTH || x < 0 || y >= HEIGHT || y < 0)
        gameOver = 1;

    if (x == fruitX && y == fruitY)
    {
        score += 10;
        fruitX = rand() % WIDTH;
        fruitY = rand() % HEIGHT;
    }
}

int main()
{
    setup();

    while (!gameOver)
    {
        draw();
        input();
        logic();
    }

    printf("Game Over! Final Score: %d\n", score);
    return 0;
}
