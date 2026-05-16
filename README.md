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
Updated: 2026-05-16T21:41:36.821467+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.953 |  |
| ap-east-1 | 0.754 |  |
| ap-east-2 | 0.690 |  |
| ap-northeast-1 | 0.568 |  |
| ap-northeast-2 | 0.671 |  |
| ap-northeast-3 | 0.594 |  |
| ap-south-1 | 0.869 |  |
| ap-south-2 | 0.937 |  |
| ap-southeast-1 | 0.823 |  |
| ap-southeast-2 | 0.729 |  |
| ap-southeast-3 | 0.878 |  |
| ap-southeast-4 | 0.770 |  |
| ap-southeast-5 | 0.841 |  |
| ap-southeast-6 | 0.834 |  |
| ap-southeast-7 | 0.923 |  |
| ca-central-1 | 0.124 | 16 |
| ca-west-1 | 0.230 |  |
| eu-central-1 | 0.461 |  |
| eu-central-2 | 0.477 |  |
| eu-north-1 | 0.506 |  |
| eu-south-1 | 0.482 |  |
| eu-south-2 | 0.496 |  |
| eu-west-1 | 0.384 |  |
| eu-west-2 | 0.417 |  |
| eu-west-3 | 0.440 |  |
| il-central-1 | 0.620 |  |
| me-central-1 | 0.843 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.214 |  |
| sa-east-1 | 0.566 |  |
| us-east-1 | 0.102 | 4649 |
| us-east-2 | 0.079 | 1597 |
| us-gov-east-1 | 0.077 | 1696 |
| us-gov-west-1 | 0.237 | 195 |
| us-west-1 | 0.191 | 3569 |
| us-west-2 | 0.238 | 158 |

