# Agonize: The best programming language there is

![logo-300](https://user-images.githubusercontent.com/66139317/181281993-0177c835-bd68-4b0d-a70a-e4c0e91282c2.png)

**Agonize** is an esoteric programming language that ships with insane features
such as I/O operations, and in a way simple arithmetic calculations such as
addition and subtraction. **Agonize** is an interpreted language (may change
sometime in the future) whose interpreter was built with Google's Dart.
**Agonize** is completely open source with pride.

## Interpreter Usage

The **Agonize** Interpreter's usage is as follows:

```sh
$ agonize [file]
```

This `file` argument can be omitted and the code will be read from `stdin`.
Otherwise, `agonize` will try to open the path provided at `file` and read the
code from there. Then this code will be executed by the interpreter.

## Hello World

Creating your first "Hello, world!" program in **Agonize** can be as easy as
2,378 characters.

```py
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++>
------------------------------------------------------------------------
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
+++++++++++++++++++++++++++++++>
----------------------------------------------------------------------
-------------------------------
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
++++++++++++++++++++++++++++++++++++++>
----------------------------------------------------------------------
--------------------------------------
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
++++++++++++++++++++++++++++++++++++++>
----------------------------------------------------------------------
--------------------------------------
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
+++++++++++++++++++++++++++++++++++++++++>
----------------------------------------------------------------------
-----------------------------------------
++++++++++++++++++++++++++++++++++++++++++++>
--------------------------------------------
++++++++++++++++++++++++++++++++>
--------------------------------
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
+++++++++++++++++++++++++++++++++++++++++++++++++>
----------------------------------------------------------------------
-------------------------------------------------
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
+++++++++++++++++++++++++++++++++++++++++>
----------------------------------------------------------------------
-----------------------------------------
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
++++++++++++++++++++++++++++++++++++++++++++>
----------------------------------------------------------------------
--------------------------------------------
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
++++++++++++++++++++++++++++++++++++++>
----------------------------------------------------------------------
--------------------------------------
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
++++++++++++++++++++++++++++++>
----------------------------------------------------------------------
------------------------------
+++++++++++++++++++++++++++++++++>
---------------------------------
```

This code _can_ be optimized, but for that you'll need to learn the
fundamentals and the syntax.

## Fundamentals

Great! You've landed at the best place to start learning a new language: The
Basics. **Agonize** is very similar to BrainF, but unlike the latter,
**Agonize** has just one value that can be incremented and decremented. This
value can be incremented with the `+` operator, decremented with the `-`
operator, outputted with the `>` command, and added to from input with the `<`.

### + Operator

To increase the value (called the **point**) by one, use the `+` operator. The
following code sets the point to one:

```
+
```

### - Operator

To decrease the point by one, use the `-` operator. The
following code sets the point to 1,114,111 (when the point goes below the
inclusive range of 0..1,114,111 it "cycles" to the end):

```
-
```

### > Command

To output the character with the Unicode codepoint of the point to `stdout`,
use the `>` command. The following code writes a line feed (10):

```
++++++++++>
```

### < Command

To read from `stdin` and add the value of the Unicode codepoint to the point,
use the `<` command. The following code writes what the user types:

```
<>
```

### Loops

The support for loops greatly enhances **Agonize**. The syntax for loops looks
like so:

```
[OPERATIONS] *
             The number of asterisks here determines
             how many times the loop will run
```

The following code writes the letter "A" (65) to the console:

```
[+++++++++++++]*****>
```

## Comments

Anything that is not in the character set `+-[]*<>` will be regarded as a
comment, including whitepsaces such as line feeds and spaces.

## Conclusion

With the help of everything that you have read so far, you should be able to
improve the above "Hello, world!" program on your own. Happy agonizing!
