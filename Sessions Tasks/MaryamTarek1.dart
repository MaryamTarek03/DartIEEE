import 'dart:io';

void main()
{
  List<int> l=[1,6,45,70,45,120,1];
  // task01();
  // task02();
  // task03();
  // task04();
  // List<int> set = task05(l);print(set);
  // task06();
  task07();
}

void task01()
{
  int age=int.parse(stdin.readLineSync()!);
  age =100-age;
  print("You have $age years to go!");
}

void task02()
{
  int n=int.parse(stdin.readLineSync()!);
  if (n%2==1) print("It is an ODD number!");
  else print("It is an Even number!");
}

void task03()
{
  List<int> l = [];
  print("Please enter the List size: ");
  int size=int.parse(stdin.readLineSync()!);
  for(int i=0;i<size;i++)
  {
    print("Please enter number ${i + 1}: ");
    int x=int.parse(stdin.readLineSync()!);
    l.add(x);
  }
  print("Numbers less than 5 are: ");
  for(int i=0;i<size;i++)
  {
    if (l[i]<5) print(l[i]);
  }
}

void task04()
{
  int n=int.parse(stdin.readLineSync()!);
  for (int i=1; i<=n/2;i++)
  {
      if(n%i==0) print(i);
  }
}

List<int> task05(List l)
{
  List<int> x=[];
  for (int i in l)
  {
    if(!x.contains(i)) x.add(i);
  }
  return x;
}

void task06()
{
  List<String> days=[];
  days.addAll({'Saturday','Sunday','Monday','Tuesday','Wednesday','Thursday','Friday'});
  print(days);

  ///OR
  // List<String> x=['Saturday','Sunday','Monday','Tuesday','Wednesday','Thursday','Friday'];
  // for (int i=0;i<7;i++) days.add(x[i]);
}

void task07()
{
  int n=0;
  List<String> tasks=[];
  do
    {
      print("1 to add a new task\n2 to remove a task\n3 to view your tasks\n0 to QUIT");
      n=int.parse(stdin.readLineSync()!);
      switch(n)
      {
        case 0:break;
        case 1:
          print('Please enter your task: ');
          String s=stdin.readLineSync()!;
          tasks.add(s);
          break;
        case 2:
        if(!tasks.isEmpty)
        {
          print('Please enter the number of the task');
          int num = int.parse(stdin.readLineSync()!);
          while ((num-1)>=tasks.length) print("There is no such Task");
          tasks.removeAt(num - 1);
        }
        else print("You have no tasks\n\n");
        break;
        case 3:
          if(!tasks.isEmpty)
          {
            for (int i = 0; i < tasks.length; i++) print("${i + 1} ${tasks[i]}");
            print("\n\n\n");
          }
          else print("You have no tasks\n\n");
          break;
        default:
          print("This is Invalid");
      }
    }while(n!=0);
}