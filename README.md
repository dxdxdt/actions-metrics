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
Updated: 2026-07-02T09:54:48.554255+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.869 |  |
| ap-east-1 | 0.823 |  |
| ap-east-2 | 0.762 |  |
| ap-northeast-1 | 0.641 |  |
| ap-northeast-2 | 0.740 |  |
| ap-northeast-3 | 0.663 |  |
| ap-south-1 | 0.833 |  |
| ap-south-2 | 0.899 |  |
| ap-southeast-1 | 0.894 |  |
| ap-southeast-2 | 0.770 |  |
| ap-southeast-3 | 0.947 |  |
| ap-southeast-4 | 0.841 |  |
| ap-southeast-5 | 0.912 |  |
| ap-southeast-6 | 0.816 |  |
| ap-southeast-7 | 1.001 |  |
| ca-central-1 | 0.118 | 16 |
| ca-west-1 | 0.300 |  |
| eu-central-1 | 0.390 |  |
| eu-central-2 | 0.415 |  |
| eu-north-1 | 0.436 |  |
| eu-south-1 | 0.423 |  |
| eu-south-2 | 0.425 |  |
| eu-west-1 | 0.316 |  |
| eu-west-2 | 0.350 |  |
| eu-west-3 | 0.369 |  |
| il-central-1 | 0.566 |  |
| me-central-1 | 0.799 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.235 |  |
| sa-east-1 | 0.496 |  |
| us-east-1 | 0.061 | 4811 |
| us-east-2 | 0.130 | 1650 |
| us-gov-east-1 | 0.124 | 1727 |
| us-gov-west-1 | 0.304 | 200 |
| us-west-1 | 0.259 | 3726 |
| us-west-2 | 0.308 | 164 |

