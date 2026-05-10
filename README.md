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
Updated: 2026-05-10T17:43:43.093227+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.917 |  |
| ap-east-1 | 0.797 |  |
| ap-east-2 | 0.720 |  |
| ap-northeast-1 | 0.604 |  |
| ap-northeast-2 | 0.718 |  |
| ap-northeast-3 | 0.630 |  |
| ap-south-1 | 0.843 |  |
| ap-south-2 | 0.936 |  |
| ap-southeast-1 | 0.870 |  |
| ap-southeast-2 | 0.787 |  |
| ap-southeast-3 | 0.913 |  |
| ap-southeast-4 | 0.826 |  |
| ap-southeast-5 | 0.878 |  |
| ap-southeast-6 | 0.831 |  |
| ap-southeast-7 | 0.965 |  |
| ca-central-1 | 0.107 | 16 |
| ca-west-1 | 0.261 |  |
| eu-central-1 | 0.413 |  |
| eu-central-2 | 0.432 |  |
| eu-north-1 | 0.456 |  |
| eu-south-1 | 0.436 |  |
| eu-south-2 | 0.455 |  |
| eu-west-1 | 0.340 |  |
| eu-west-2 | 0.377 |  |
| eu-west-3 | 0.400 |  |
| il-central-1 | 0.572 |  |
| me-central-1 | 0.798 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.223 |  |
| sa-east-1 | 0.508 |  |
| us-east-1 | 0.069 | 4622 |
| us-east-2 | 0.073 | 1585 |
| us-gov-east-1 | 0.082 | 1685 |
| us-gov-west-1 | 0.297 | 195 |
| us-west-1 | 0.246 | 3547 |
| us-west-2 | 0.296 | 157 |

