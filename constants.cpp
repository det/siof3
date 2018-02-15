#include <string>
#include <iostream>

struct X {
    X() {std::cout << "X()\n";}
    ~X() {std::cout << "~X()\n";}
};


#define DEFINE_INLINE_VARIABLE(type, name, initializer)       \
  template <typename = void>                                  \
  struct inline_variable_##name {                             \
    static type instance;                                     \
  };                                                          \
  template <typename Dummy>                                   \
  type inline_variable_##name<Dummy>::instance = initializer; \
  static auto &name = inline_variable_##name<>::instance



inline X x;
/*
DEFINE_INLINE_VARIABLE(X, x2, {});

inline X& GetX() {
    static X x;
    return x;
}

static X & x = GetX();
*/
