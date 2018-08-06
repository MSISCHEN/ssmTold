package com.cyj.pojo;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class NoicesExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public NoicesExample() {
        oredCriteria = new ArrayList<Criteria>();
    }

    public void setOrderByClause(String orderByClause) {
        this.orderByClause = orderByClause;
    }

    public String getOrderByClause() {
        return orderByClause;
    }

    public void setDistinct(boolean distinct) {
        this.distinct = distinct;
    }

    public boolean isDistinct() {
        return distinct;
    }

    public List<Criteria> getOredCriteria() {
        return oredCriteria;
    }

    public void or(Criteria criteria) {
        oredCriteria.add(criteria);
    }

    public Criteria or() {
        Criteria criteria = createCriteriaInternal();
        oredCriteria.add(criteria);
        return criteria;
    }

    public Criteria createCriteria() {
        Criteria criteria = createCriteriaInternal();
        if (oredCriteria.size() == 0) {
            oredCriteria.add(criteria);
        }
        return criteria;
    }

    protected Criteria createCriteriaInternal() {
        Criteria criteria = new Criteria();
        return criteria;
    }

    public void clear() {
        oredCriteria.clear();
        orderByClause = null;
        distinct = false;
    }

    protected abstract static class GeneratedCriteria {
        protected List<Criterion> criteria;

        protected GeneratedCriteria() {
            super();
            criteria = new ArrayList<Criterion>();
        }

        public boolean isValid() {
            return criteria.size() > 0;
        }

        public List<Criterion> getAllCriteria() {
            return criteria;
        }

        public List<Criterion> getCriteria() {
            return criteria;
        }

        protected void addCriterion(String condition) {
            if (condition == null) {
                throw new RuntimeException("Value for condition cannot be null");
            }
            criteria.add(new Criterion(condition));
        }

        protected void addCriterion(String condition, Object value, String property) {
            if (value == null) {
                throw new RuntimeException("Value for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value));
        }

        protected void addCriterion(String condition, Object value1, Object value2, String property) {
            if (value1 == null || value2 == null) {
                throw new RuntimeException("Between values for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value1, value2));
        }

        public Criteria andNoiceIdIsNull() {
            addCriterion("noice_id is null");
            return (Criteria) this;
        }

        public Criteria andNoiceIdIsNotNull() {
            addCriterion("noice_id is not null");
            return (Criteria) this;
        }

        public Criteria andNoiceIdEqualTo(Integer value) {
            addCriterion("noice_id =", value, "noiceId");
            return (Criteria) this;
        }

        public Criteria andNoiceIdNotEqualTo(Integer value) {
            addCriterion("noice_id <>", value, "noiceId");
            return (Criteria) this;
        }

        public Criteria andNoiceIdGreaterThan(Integer value) {
            addCriterion("noice_id >", value, "noiceId");
            return (Criteria) this;
        }

        public Criteria andNoiceIdGreaterThanOrEqualTo(Integer value) {
            addCriterion("noice_id >=", value, "noiceId");
            return (Criteria) this;
        }

        public Criteria andNoiceIdLessThan(Integer value) {
            addCriterion("noice_id <", value, "noiceId");
            return (Criteria) this;
        }

        public Criteria andNoiceIdLessThanOrEqualTo(Integer value) {
            addCriterion("noice_id <=", value, "noiceId");
            return (Criteria) this;
        }

        public Criteria andNoiceIdIn(List<Integer> values) {
            addCriterion("noice_id in", values, "noiceId");
            return (Criteria) this;
        }

        public Criteria andNoiceIdNotIn(List<Integer> values) {
            addCriterion("noice_id not in", values, "noiceId");
            return (Criteria) this;
        }

        public Criteria andNoiceIdBetween(Integer value1, Integer value2) {
            addCriterion("noice_id between", value1, value2, "noiceId");
            return (Criteria) this;
        }

        public Criteria andNoiceIdNotBetween(Integer value1, Integer value2) {
            addCriterion("noice_id not between", value1, value2, "noiceId");
            return (Criteria) this;
        }

        public Criteria andNoiceCreateTimeIsNull() {
            addCriterion("noice_create_time is null");
            return (Criteria) this;
        }

        public Criteria andNoiceCreateTimeIsNotNull() {
            addCriterion("noice_create_time is not null");
            return (Criteria) this;
        }

        public Criteria andNoiceCreateTimeEqualTo(Date value) {
            addCriterion("noice_create_time =", value, "noiceCreateTime");
            return (Criteria) this;
        }

        public Criteria andNoiceCreateTimeNotEqualTo(Date value) {
            addCriterion("noice_create_time <>", value, "noiceCreateTime");
            return (Criteria) this;
        }

        public Criteria andNoiceCreateTimeGreaterThan(Date value) {
            addCriterion("noice_create_time >", value, "noiceCreateTime");
            return (Criteria) this;
        }

        public Criteria andNoiceCreateTimeGreaterThanOrEqualTo(Date value) {
            addCriterion("noice_create_time >=", value, "noiceCreateTime");
            return (Criteria) this;
        }

        public Criteria andNoiceCreateTimeLessThan(Date value) {
            addCriterion("noice_create_time <", value, "noiceCreateTime");
            return (Criteria) this;
        }

        public Criteria andNoiceCreateTimeLessThanOrEqualTo(Date value) {
            addCriterion("noice_create_time <=", value, "noiceCreateTime");
            return (Criteria) this;
        }

        public Criteria andNoiceCreateTimeIn(List<Date> values) {
            addCriterion("noice_create_time in", values, "noiceCreateTime");
            return (Criteria) this;
        }

        public Criteria andNoiceCreateTimeNotIn(List<Date> values) {
            addCriterion("noice_create_time not in", values, "noiceCreateTime");
            return (Criteria) this;
        }

        public Criteria andNoiceCreateTimeBetween(Date value1, Date value2) {
            addCriterion("noice_create_time between", value1, value2, "noiceCreateTime");
            return (Criteria) this;
        }

        public Criteria andNoiceCreateTimeNotBetween(Date value1, Date value2) {
            addCriterion("noice_create_time not between", value1, value2, "noiceCreateTime");
            return (Criteria) this;
        }

        public Criteria andNoiceStatusIsNull() {
            addCriterion("noice_status is null");
            return (Criteria) this;
        }

        public Criteria andNoiceStatusIsNotNull() {
            addCriterion("noice_status is not null");
            return (Criteria) this;
        }

        public Criteria andNoiceStatusEqualTo(Integer value) {
            addCriterion("noice_status =", value, "noiceStatus");
            return (Criteria) this;
        }

        public Criteria andNoiceStatusNotEqualTo(Integer value) {
            addCriterion("noice_status <>", value, "noiceStatus");
            return (Criteria) this;
        }

        public Criteria andNoiceStatusGreaterThan(Integer value) {
            addCriterion("noice_status >", value, "noiceStatus");
            return (Criteria) this;
        }

        public Criteria andNoiceStatusGreaterThanOrEqualTo(Integer value) {
            addCriterion("noice_status >=", value, "noiceStatus");
            return (Criteria) this;
        }

        public Criteria andNoiceStatusLessThan(Integer value) {
            addCriterion("noice_status <", value, "noiceStatus");
            return (Criteria) this;
        }

        public Criteria andNoiceStatusLessThanOrEqualTo(Integer value) {
            addCriterion("noice_status <=", value, "noiceStatus");
            return (Criteria) this;
        }

        public Criteria andNoiceStatusIn(List<Integer> values) {
            addCriterion("noice_status in", values, "noiceStatus");
            return (Criteria) this;
        }

        public Criteria andNoiceStatusNotIn(List<Integer> values) {
            addCriterion("noice_status not in", values, "noiceStatus");
            return (Criteria) this;
        }

        public Criteria andNoiceStatusBetween(Integer value1, Integer value2) {
            addCriterion("noice_status between", value1, value2, "noiceStatus");
            return (Criteria) this;
        }

        public Criteria andNoiceStatusNotBetween(Integer value1, Integer value2) {
            addCriterion("noice_status not between", value1, value2, "noiceStatus");
            return (Criteria) this;
        }
    }

    public static class Criteria extends GeneratedCriteria {

        protected Criteria() {
            super();
        }
    }

    public static class Criterion {
        private String condition;

        private Object value;

        private Object secondValue;

        private boolean noValue;

        private boolean singleValue;

        private boolean betweenValue;

        private boolean listValue;

        private String typeHandler;

        public String getCondition() {
            return condition;
        }

        public Object getValue() {
            return value;
        }

        public Object getSecondValue() {
            return secondValue;
        }

        public boolean isNoValue() {
            return noValue;
        }

        public boolean isSingleValue() {
            return singleValue;
        }

        public boolean isBetweenValue() {
            return betweenValue;
        }

        public boolean isListValue() {
            return listValue;
        }

        public String getTypeHandler() {
            return typeHandler;
        }

        protected Criterion(String condition) {
            super();
            this.condition = condition;
            this.typeHandler = null;
            this.noValue = true;
        }

        protected Criterion(String condition, Object value, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.typeHandler = typeHandler;
            if (value instanceof List<?>) {
                this.listValue = true;
            } else {
                this.singleValue = true;
            }
        }

        protected Criterion(String condition, Object value) {
            this(condition, value, null);
        }

        protected Criterion(String condition, Object value, Object secondValue, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.secondValue = secondValue;
            this.typeHandler = typeHandler;
            this.betweenValue = true;
        }

        protected Criterion(String condition, Object value, Object secondValue) {
            this(condition, value, secondValue, null);
        }
    }
}