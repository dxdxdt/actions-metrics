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
Updated: 2026-04-18T06:09:22.467665+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.982 |  |
| ap-east-1 | 0.714 |  |
| ap-east-2 | 0.647 |  |
| ap-northeast-1 | 0.538 |  |
| ap-northeast-2 | 0.629 |  |
| ap-northeast-3 | 0.563 |  |
| ap-south-1 | 0.911 |  |
| ap-south-2 | 0.962 |  |
| ap-southeast-1 | 0.787 |  |
| ap-southeast-2 | 0.701 |  |
| ap-southeast-3 | 0.840 |  |
| ap-southeast-4 | 0.738 |  |
| ap-southeast-5 | 0.800 |  |
| ap-southeast-6 | 0.729 |  |
| ap-southeast-7 | 0.889 |  |
| ca-central-1 | 0.188 | 16 |
| ca-west-1 | 0.265 |  |
| eu-central-1 | 0.489 |  |
| eu-central-2 | 0.503 |  |
| eu-north-1 | 0.531 |  |
| eu-south-1 | 0.507 |  |
| eu-south-2 | 0.520 |  |
| eu-west-1 | 0.402 |  |
| eu-west-2 | 0.450 |  |
| eu-west-3 | 0.473 |  |
| il-central-1 | 0.664 |  |
| me-central-1 | 0.854 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.208 |  |
| sa-east-1 | 0.603 |  |
| us-east-1 | 0.158 | 4519 |
| us-east-2 | 0.119 | 1510 |
| us-gov-east-1 | 0.148 | 1655 |
| us-gov-west-1 | 0.210 | 194 |
| us-west-1 | 0.155 | 3428 |
| us-west-2 | 0.208 | 156 |

