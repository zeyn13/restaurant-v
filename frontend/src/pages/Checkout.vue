<template>
    <div class="checkout-container">
        <div class="checkout-form-container">
            <form id="checkoutForm" @submit="handleSubmit" novalidate autocomplete="off">
                <div class="checkout-heading">
                    <h3>Few more step to place your order<span>Total</span></h3>
                    <h3 v-if="user">{{ user.user_name }}'s Order<span>${{ calculateSummaryPrice()[3] }}</span></h3>
                </div>

                <div class="form-group details-group">
                    <h4>Shipping Details</h4>
                    <div class="form-group">
                        <input type="text" name="coPhone" id="coPhone" placeholder="Phone number" class="form-control"
                            v-model="checkoutObj.phone" />
                        <p class="error-mess" v-if="errorObj.phoneErr.length > 0">{{ errorObj.phoneErr[0] }}</p>
                    </div>

                    <div class="form-group">
                        <input type="text" name="coAddress" id="coAddress" placeholder="Address in Hanoi, Vietnam"
                            class="form-control" v-model="checkoutObj.address" />
                        <p class="error-mess" v-if="errorObj.addressErr.length > 0">{{ errorObj.addressErr[0] }}</p>
                    </div>
                </div>

                <div class="form-group details-group">
                    <h4>Payment Method</h4>
                    <div class="form-group">
                        <div class="form-group">
                            <input type="radio" name="payment" value="cash" id="paymentCash"
                                v-model="checkoutObj.paymentMethod" /><span>Cash</span>
                            <input type="radio" name="payment" value="card" id="paymentCard"
                                v-model="checkoutObj.paymentMethod" /><span>Card (Visa)</span>
                        </div>
                        <p class="error-mess" v-if="errorObj.payErr.length > 0">{{ errorObj.payErr[0] }}</p>
                    </div>


                    <div v-if="checkoutObj.paymentMethod == 'card'">
                        <div class="form-group">
                            <input type="text" name="coCardNum" placeholder="Enter your card number" id="coCardNum"
                                class="form-control" v-model="cardObj.number" size="16" maxlength="16" />
                            <p class="error-mess" v-if="errorObj.numErr.length > 0">{{ errorObj.numErr[0] }}</p>
                        </div>

                        <div class="form-group">
                            <input v-upcase type="text" name="coCardName" placeholder="Enter the name in your card "
                                id="coCardName" class="form-control" v-model="cardObj.name" />
                            <p class="error-mess" v-if="errorObj.nameErr.length > 0">{{ errorObj.nameErr[0] }}</p>
                        </div>

                        <div class="form-group">
                            <div class="form-control">
                                <span
                                    style="font-size: 1.6rem; position: absolute; margin-left: -5px; margin-top: -11px;">Expiry
                                    Date:
                                </span>
                                <input
                                    style="position: absolute; margin-left: 100px; margin-top: -12px; background: inherit;"
                                    type="month" name="coCardEx" id="coCardEx" v-model="cardObj.expiryDate"
                                    @click="availableTime()" />
                            </div>
                            <p class="error-mess" v-if="errorObj.exDateErr.length > 0">{{ errorObj.exDateErr[0] }}</p>
                        </div>

                        <div class="form-group">
                            <input type="text" name="coCardCvv" placeholder="CVV" id="coCardCvv" class="form-control"
                                v-model="cardObj.cvv" />
                            <p class="error-mess" v-if="errorObj.cvvErr.length > 0">{{ errorObj.cvvErr[0] }}</p>
                        </div>
                    </div>
                </div>

                <div v-if="user" class="form-group">
                    <input type="submit" value="CONFIRM & PAY" class="btn"
                        :disabled="filterFoods.length ? false : true" />
                </div>
            </form>
        </div>
    </div>
</template>