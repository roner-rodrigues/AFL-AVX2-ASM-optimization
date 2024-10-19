# Assembly-Level Fuzzing Optimization Using AVX2

In recent decades, there has been a significant increase in the popularization of digital technology, along with growing reliance on it across all sectors of society. However, the concern for **cybersecurity** from companies and professionals often does not align with the recommended security standards, leading to frequent security breaches, denial-of-service attacks, sensitive data leaks, and other undesirable actions.

## Motivation

Given this scenario, it is crucial to develop technologies that can, if not eliminate, at least **mitigate** the attack surface of modern commercial applications. This work focuses on exploring the potential for optimizing an application fuzzer at the assembly level to improve efficiency and reduce execution overhead.

## Objective

The study aims to optimize the main function of a fuzzer by using the **AVX2** (Advanced Vector Extensions) instruction set, which leverages instruction-level parallelism in the CPU. The goal is to enhance the performance of the function, reducing execution time and thus decreasing the overhead imposed on the application.

## Results

- **Best case**: 37.37% reduction in overhead for the optimized function.
- **Worst case**: 16.14% reduction in overhead.

These results show that utilizing AVX2 instructions can significantly improve the performance of fuzzers, which is especially important for applications that require high performance in security environments.

## Conclusion

Optimizing fuzzers at the assembly level by taking advantage of vectorized instructions like **AVX2** can be an effective strategy to improve the efficiency of security applications, significantly reducing overhead in real-world usage scenarios.
