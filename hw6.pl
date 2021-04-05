
/*
insert has 3 arguments
1. An integer: N
2. A list of integers which we can assume is sorted: Xs
3. The list Xs with N inserted into its proper place

Example:  insert(4,[1,3,5,7],[1,3,4,5,7]).
*/
insert(N,[X|Xs],[X|Ys]) :- X=<N, insert(N,Xs,Ys).
insert(N,[X|Xs],[N,X|Xs]).
insert(N,[],[N]).

/*
insertionSort has 2 arguments
1. A list of integers: Xs
2. The sorted version of Xs, sorted using insertion sort

In insertion sort, we sort all but the first element,
  then insert the first element in its proper place.
*/
insertionSort([],[]).
insertionSort([X|Xs],Sorted) :- insertionSort(Xs,Part), insert(X,Part,Sorted).

/*
part has 4 arguments
1. An integer: P
2. A list: Xs
3. A list of all the elements of Xs less than or equal to P.
4. A list of all the elements of Xs greater than P.

Example:  part(5,[6,3,4,8,2,5],[2,3,4,5],[6,8]).
*/
part(P,[X|Xs],[X|L],G) :- X=<P, part(P,Xs,L,G).
part(P,[X|Xs],L,[X|G]) :- X>P, part(P,Xs,L,G).
part(P,[],[],[]).

/*
quickSort has 2 arguments
1. A list of integers Xs
2. The list Xs sorted using quick sort

In quick sort, the list is partitioned around the first element,
  then each partition is then sorted and appended together.
*/
quickSort([],[]).
quickSort([X|Xs],Sorted) :- part(X,Xs,Left,Right), quickSort(Left,LeftSorted), quickSort(Right,RightSorted), append(LeftSorted,[X|RightSorted],Sorted).

/*
takeout has 3 arguments
1. An integer: N
2. A list Xs
3. A list that is the same as Xs but one occurence of N is removed

Example:  takeout(3,[1,2,3,4,5],[1,2,4,5]).
*/
takeout(X,[X|Ys],Ys).
takeout(X,[Y|Ys],[Y|Zs]) :- takeout(X,Ys,Zs).

/*
perm has 2 arguments
1. A list Xs
2. A permutation of Xs

Example:  perm([2,7,3,8,5,1],[3,8,1,2,5,7]).
*/
perm([],[]).
perm([X|Xs],Permuated) :- perm(Xs,Permuated1), takeout(X,Permuated,Permuated1).

/*
sorted has 1 argument
1. a sorted list
*/
sorted([]).
sorted([_]).
sorted([X,Y|Xs]) :- X=<Y, sorted([Y|Xs]).

/*
dumbSort has 2 arguments
1. A list Xs
2. The list Xs sorted using dumb sort

In dumb sort, the permutations of a list are created,
  and checked to see if they are sorted.
*/
dumbSort(Xs,Sorted) :- perm(Xs,Sorted), sorted(Sorted).
