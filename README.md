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
Updated: 2026-05-16T02:10:49.627652+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.864 |  |
| ap-east-1 | 0.829 |  |
| ap-east-2 | 0.774 |  |
| ap-northeast-1 | 0.637 |  |
| ap-northeast-2 | 0.763 |  |
| ap-northeast-3 | 0.679 |  |
| ap-south-1 | 0.811 |  |
| ap-south-2 | 0.865 |  |
| ap-southeast-1 | 0.890 |  |
| ap-southeast-2 | 0.818 |  |
| ap-southeast-3 | 0.943 |  |
| ap-southeast-4 | 0.861 |  |
| ap-southeast-5 | 0.915 |  |
| ap-southeast-6 | 0.883 |  |
| ap-southeast-7 | 0.999 |  |
| ca-central-1 | 0.105 | 16 |
| ca-west-1 | 0.283 |  |
| eu-central-1 | 0.377 |  |
| eu-central-2 | 0.394 |  |
| eu-north-1 | 0.418 |  |
| eu-south-1 | 0.404 |  |
| eu-south-2 | 0.408 |  |
| eu-west-1 | 0.293 |  |
| eu-west-2 | 0.333 |  |
| eu-west-3 | 0.358 |  |
| il-central-1 | 0.532 |  |
| me-central-1 | 0.749 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.243 |  |
| sa-east-1 | 0.476 |  |
| us-east-1 | 0.046 | 4645 |
| us-east-2 | 0.091 | 1595 |
| us-gov-east-1 | 0.088 | 1692 |
| us-gov-west-1 | 0.343 | 195 |
| us-west-1 | 0.281 | 3565 |
| us-west-2 | 0.341 | 158 |

