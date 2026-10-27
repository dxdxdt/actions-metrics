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
Updated: 2026-10-27T13:49:20.075235+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.706 |  |
| ap-east-1 | 0.621 |  |
| ap-east-2 | 0.577 |  |
| ap-northeast-1 | 0.482 |  |
| ap-northeast-2 | 0.577 |  |
| ap-northeast-3 | 0.504 |  |
| ap-south-1 | 0.667 |  |
| ap-south-2 | 0.759 |  |
| ap-southeast-1 | 0.682 |  |
| ap-southeast-2 | 0.604 |  |
| ap-southeast-3 | 0.728 |  |
| ap-southeast-4 | 0.669 |  |
| ap-southeast-5 | 0.698 |  |
| ap-southeast-6 | 0.655 |  |
| ap-southeast-7 | 0.762 |  |
| ca-central-1 | 0.091 | 18 |
| ca-west-1 | 0.174 |  |
| eu-central-1 | 0.327 |  |
| eu-central-2 | 0.342 |  |
| eu-north-1 | 0.373 |  |
| eu-south-1 | 0.338 |  |
| eu-south-2 | 0.330 |  |
| eu-west-1 | 0.257 |  |
| eu-west-2 | 0.288 |  |
| eu-west-3 | 0.310 |  |
| il-central-1 | 0.444 |  |
| me-central-1 | 0.760 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.205 |  |
| sa-east-1 | 0.402 |  |
| us-east-1 | 0.052 | 5163 |
| us-east-2 | 0.083 | 1712 |
| us-gov-east-1 | 0.086 | 1955 |
| us-gov-west-1 | 0.231 | 240 |
| us-west-1 | 0.193 | 4196 |
| us-west-2 | 0.231 | 195 |

