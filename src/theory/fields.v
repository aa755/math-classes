Require Import
  Morphisms Program Ring
  abstract_algebra strong_setoids.
Require Export
  theory.rings.

Section field_properties. 
Context `{Field F}.

Add Ring F : (stdlib_ring_theory F).

Lemma mult_inverse_alt (x : F) Px : x // x↾Px = 1.
Proof. now rewrite <-(mult_inverse (x↾Px)). Qed.

Global Instance: StrongInjective (-).
Proof.
  repeat (split; try apply _); intros x y E.
   apply (strong_extensionality (+ x + y)).
   ring_simplify. now symmetry.
  apply (strong_extensionality (+ -x + -y)).
  ring_simplify. now symmetry.
Qed.

Global Instance: StrongInjective (//).
Proof.
  repeat (split; try apply _); intros x y E.
   apply (strong_extensionality (`x *.)).
   rewrite mult_inverse, commutativity.
   apply (strong_extensionality (`y *.)).
   rewrite associativity, mult_inverse.
   ring_simplify. now symmetry.
  apply (strong_extensionality (.* // x)).
  rewrite mult_inverse, commutativity.
  apply (strong_extensionality (.* // y)).
  rewrite <-associativity, mult_inverse.
  ring_simplify. now symmetry.
Qed.

Global Instance: ∀ z, StrongLeftCancellation (+) z.
Proof. intros z x y E. apply (strong_extensionality (+ -z)). now ring_simplify. Qed.

Global Instance: ∀ z, StrongRightCancellation (+) z.
Proof. intros. apply (strong_right_cancel_from_left (+)). Qed.

Global Instance: ∀ z, PropHolds (z ⪥ 0) → StrongLeftCancellation (.*.) z.
Proof. 
  intros z Ez x y E. red in Ez.
  rewrite !(commutativity z).
  apply (strong_extensionality (.* // z↾(Ez : (⪥0) z))).
  rewrite <-!associativity, !mult_inverse_alt.
  now ring_simplify.
Qed.

Global Instance: ∀ z, PropHolds (z ⪥ 0) → StrongRightCancellation (.*.) z.
Proof. intros. apply (strong_right_cancel_from_left (.*.)). Qed.

Lemma mult_apart_zero_l x y : x * y ⪥ 0 → x ⪥ 0.
Proof. intros. apply (strong_extensionality (.* y)). now rewrite mult_0_l. Qed.

Lemma mult_apart_zero_r x y : x * y ⪥ 0 → y ⪥ 0.
Proof. intros. apply (strong_extensionality (x *.)). now rewrite mult_0_r. Qed.

Instance mult_apart_zero x y : 
  PropHolds (x ⪥ 0) → PropHolds (y ⪥ 0) → PropHolds (x * y ⪥ 0).
Proof.
  intros Ex Ey.
  apply (strong_extensionality (.* // y↾(Ey : (⪥0) y))).
  now rewrite <-associativity, mult_inverse_alt, mult_1_r, mult_0_l.
Qed.

Instance: NoZeroDivisors F.
Proof.
  intros x [x_nonzero [y [y_nonzero E]]].
  rewrite <-tight_apart in y_nonzero. destruct y_nonzero. intro y_apartzero.
  apply x_nonzero.
  rewrite <- mult_1_r. rewrite <- (mult_inverse_alt y y_apartzero).
  rewrite associativity, E. ring.
Qed.

Global Instance: IntegralDomain F.
Proof. split; try apply _. Qed.

Global Instance apart_0_sig_apart_0: ∀ (x : F ₀), PropHolds (`x ⪥ 0).
Proof. now intros [??]. Qed.

Instance mult_inv_apart_zero x : PropHolds (// x ⪥ 0).
Proof.
  red.
  apply mult_apart_zero_r with (`x).
  rewrite mult_inverse. solve_propholds.
Qed.

Lemma field_div_0_l x y : x = 0 → x // y = 0.
Proof. intros E. rewrite E. apply left_absorb. Qed.

Lemma field_div_diag x y : x = `y → x // y = 1.
Proof. intros E. rewrite E. apply mult_inverse. Qed.

Lemma equal_quotients (a c: F) b d : a * `d = c * `b ↔ a // b = c // d.
Proof with try ring.
  split; intro E.
   transitivity (1 * (a // b))...
   rewrite <- (mult_inverse d).
   transitivity (// d * (a * `d) // b)...
   rewrite E.
   transitivity (// d * c * (`b // b))...
   rewrite mult_inverse...
  transitivity (a * `d * 1)...
  rewrite <- (mult_inverse b).
  transitivity (a // b * `d * `b)...
  rewrite E.
  transitivity (c * (`d // d) * `b)...
  rewrite mult_inverse...
Qed. (* todo: should be cleanable *)

Lemma mult_inv_distr_alt (x y : F) Px Py Pxy : 
  // (x * y)↾Pxy = // x↾Px * // y↾Py.
Proof with try ring.
  apply (left_cancellation_ne_0 (.*.) (x * y)).
   now apply apart_ne.
  transitivity ((x // x↾Px) *  (y // y↾Py))...
  transitivity ((x * y) // (x * y)↾Pxy)...
  rewrite 3!mult_inverse_alt...
Qed.
End field_properties.

(* Due to bug #2528 *)
Hint Extern 8 (PropHolds (// _ ⪥ 0)) => eapply @mult_inv_apart_zero : typeclass_instances.
Hint Extern 8 (PropHolds (_ * _ ⪥ 0)) => eapply @mult_apart_zero : typeclass_instances.

Section morphisms.
  Context `{Field F1} `{Field F2} `{!StrongSemiRing_Morphism (f : F1 → F2)}.

  Add Ring F1 : (stdlib_ring_theory F1).

  Lemma strong_injective_preserves_0 : (∀ x, x ⪥ 0 → f x ⪥ 0) → StrongInjective f.
  Proof.
    intros E1. split; try apply _. intros x y E2.
    apply (strong_extensionality (+ -f y)).
    rewrite plus_opp_r, <-preserves_minus.
    apply E1.
    apply (strong_extensionality (+ y)).
    now ring_simplify.
  Qed.

  Global Instance: StrongInjective f.
  Proof.
    apply strong_injective_preserves_0.
    intros x Ex.
    apply mult_apart_zero_l with (f (// exist (⪥0) x Ex)).
    rewrite <-rings.preserves_mult.
    rewrite mult_inverse_alt.
    rewrite rings.preserves_1.
    solve_propholds.
  Qed.

  Lemma preserves_mult_inv x Px Pfx : f (// x↾Px) = // (f x)↾Pfx.
  Proof.
    apply (left_cancellation_ne_0 (.*.) (f x)).
     now apply apart_ne.
    rewrite <-rings.preserves_mult.
    rewrite !mult_inverse_alt.
    now apply preserves_1.
  Qed.
End morphisms.
