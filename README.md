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
Updated: 2026-06-12T11:37:57.727794+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.870 |  |
| ap-east-1 | 0.805 |  |
| ap-east-2 | 0.750 |  |
| ap-northeast-1 | 0.619 |  |
| ap-northeast-2 | 0.747 |  |
| ap-northeast-3 | 0.647 |  |
| ap-south-1 | 0.837 |  |
| ap-south-2 | 0.909 |  |
| ap-southeast-1 | 0.880 |  |
| ap-southeast-2 | 0.784 |  |
| ap-southeast-3 | 0.943 |  |
| ap-southeast-4 | 0.823 |  |
| ap-southeast-5 | 0.909 |  |
| ap-southeast-6 | 0.817 |  |
| ap-southeast-7 | 0.987 |  |
| ca-central-1 | 0.105 | 16 |
| ca-west-1 | 0.282 |  |
| eu-central-1 | 0.381 |  |
| eu-central-2 | 0.404 |  |
| eu-north-1 | 0.427 |  |
| eu-south-1 | 0.423 |  |
| eu-south-2 | 0.422 |  |
| eu-west-1 | 0.306 |  |
| eu-west-2 | 0.341 |  |
| eu-west-3 | 0.366 |  |
| il-central-1 | 0.547 |  |
| me-central-1 | 0.790 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.241 |  |
| sa-east-1 | 0.489 |  |
| us-east-1 | 0.054 | 4746 |
| us-east-2 | 0.084 | 1632 |
| us-gov-east-1 | 0.088 | 1711 |
| us-gov-west-1 | 0.306 | 198 |
| us-west-1 | 0.258 | 3658 |
| us-west-2 | 0.306 | 162 |

