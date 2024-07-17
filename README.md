# Bazel-Hands-On

Welcome to the Bazel-Hands-On repository! This guide will help you get started with Bazel, a powerful build and test tool. Note, this is for Linux and MacOS only.

## Prerequisites

Start by [installing Bazel](https://bazel.build/install), if you haven’t already. This tutorial uses Git for source control, so for best results [install Git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git) as well.

Next, retrieve the sample project from Bazel's GitHub repository by running the following in your command-line tool of choice:

```
git clone https://github.com/GideokKim/Bazel-Hands-On.git
```

## Getting started

To proceed with each stage example, move the example directory you wish to proceed with using the command below(This command moves to the stage01 directory.):

```
cd stage01/
```

## Stage 01

It shows how to build a single file to produce an executable application.

## Stage 02

Introduce the `cc_library` rule for building C++ libraries.

## Stage 03

This stage will showcase how to integrate multiple `cc_library` targets from different packages.

## Stage 04

This stage will showcase how to use third party dependencies(also called external dependencies).

## Stage 05

In this stage we step it up and show how to resolve WARNING using the bzlmod system.
