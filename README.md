# Github Actions Metrics
Information on Github hosted runners like the Azure region they run on is
necessary info when optimising CD/CI pipelines(especially network latencies and
route path bandwidth). Github does not disclose it so I did it myself.

Using this info, place the resources(DB, object storage, other instances) near
the runners are usually run.

A few pieces of info I could gather online:

- Azure doesn't provide a list of VM service endpoints like AWS
- Github-hosted Actions runners are actually Azure VMs (surprisingly, not in a
  container)
- Github is hosted in the data centre somewhere in the US, probably in the same
  data centre where Azure is present

Microsoft definitely has more points of presence than any other cloud service
providers, but there's no official list of data center endpoints to ping. If you
look at the map,

<a href="https://aws.amazon.com/about-aws/global-infrastructure/regions_az/">
<img src="image.png" style="width: 500px;">
</a>
<a href="https://datacenters.microsoft.com/globe/explore">
<img src="image-1.png" style="width: 500px;">
</a>

they're close enough. For most devs, all that matters is probably how close
their S3 buckets are to the Github Actions runners. Some AWS and Azure regions
are under the same roof, but then again, no official data.

## DATA
Updated: 2026-05-19T03:26:55.049556+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.924 |  |
| ap-east-1 | 0.767 |  |
| ap-east-2 | 0.706 |  |
| ap-northeast-1 | 0.581 |  |
| ap-northeast-2 | 0.695 |  |
| ap-northeast-3 | 0.606 |  |
| ap-south-1 | 0.851 |  |
| ap-south-2 | 0.887 |  |
| ap-southeast-1 | 0.831 |  |
| ap-southeast-2 | 0.765 |  |
| ap-southeast-3 | 0.879 |  |
| ap-southeast-4 | 0.787 |  |
| ap-southeast-5 | 0.859 |  |
| ap-southeast-6 | 0.786 |  |
| ap-southeast-7 | 0.936 |  |
| ca-central-1 | 0.145 | 16 |
| ca-west-1 | 0.277 |  |
| eu-central-1 | 0.445 |  |
| eu-central-2 | 0.452 |  |
| eu-north-1 | 0.478 |  |
| eu-south-1 | 0.456 |  |
| eu-south-2 | 0.469 |  |
| eu-west-1 | 0.350 |  |
| eu-west-2 | 0.396 |  |
| eu-west-3 | 0.416 |  |
| il-central-1 | 0.603 |  |
| me-central-1 | 0.832 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.220 |  |
| sa-east-1 | 0.547 |  |
| us-east-1 | 0.105 | 4661 |
| us-east-2 | 0.105 | 1602 |
| us-gov-east-1 | 0.110 | 1697 |
| us-gov-west-1 | 0.270 | 195 |
| us-west-1 | 0.209 | 3578 |
| us-west-2 | 0.260 | 158 |

