module traffic_light (
    input clk,
    input reset,
    output reg [2:0] NS,   // North-South lights
    output reg [2:0] EW    // East-West lights
);

// State encoding
parameter S0 = 2'b00; // NS Green, EW Red
parameter S1 = 2'b01; // NS Yellow, EW Red
parameter S2 = 2'b10; // NS Red, EW Green
parameter S3 = 2'b11; // NS Red, EW Yellow

reg [1:0] state, next_state;
reg [3:0] count;

// State transition
always @(posedge clk or posedge reset) begin
    if (reset) begin
        state <= S0;
        count <= 0;
    end else begin
        if (count == 9) begin
            state <= next_state;
            count <= 0;
        end else begin
            count <= count + 1;
        end
    end
end

// Next state logic
always @(*) begin
    case(state)
        S0: next_state = S1;
        S1: next_state = S2;
        S2: next_state = S3;
        S3: next_state = S0;
        default: next_state = S0;
    endcase
end

// Output logic (Moore)
always @(*) begin
    case(state)
        S0: begin
            NS = 3'b001; // Green
            EW = 3'b100; // Red
        end
        S1: begin
            NS = 3'b010; // Yellow
            EW = 3'b100; // Red
        end
        S2: begin
            NS = 3'b100; // Red
            EW = 3'b001; // Green
        end
        S3: begin
            NS = 3'b100; // Red
            EW = 3'b010; // Yellow
        end
    endcase
end

endmodule
