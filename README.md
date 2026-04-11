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
Updated: 2026-04-11T21:25:45.975826+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.867 |  |
| ap-east-1 | 0.810 |  |
| ap-east-2 | 0.749 |  |
| ap-northeast-1 | 0.631 |  |
| ap-northeast-2 | 0.734 |  |
| ap-northeast-3 | 0.659 |  |
| ap-south-1 | 0.835 |  |
| ap-south-2 | 0.887 |  |
| ap-southeast-1 | 0.881 |  |
| ap-southeast-2 | 0.799 |  |
| ap-southeast-3 | 0.941 |  |
| ap-southeast-4 | 0.839 |  |
| ap-southeast-5 | 0.902 |  |
| ap-southeast-6 | 0.888 |  |
| ap-southeast-7 | 0.976 |  |
| ca-central-1 | 0.095 | 16 |
| ca-west-1 | 0.305 |  |
| eu-central-1 | 0.378 |  |
| eu-central-2 | 0.393 |  |
| eu-north-1 | 0.441 |  |
| eu-south-1 | 0.401 |  |
| eu-south-2 | 0.416 |  |
| eu-west-1 | 0.292 |  |
| eu-west-2 | 0.336 |  |
| eu-west-3 | 0.361 |  |
| il-central-1 | 0.548 |  |
| me-central-1 | 0.765 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.246 |  |
| sa-east-1 | 0.477 |  |
| us-east-1 | 0.045 | 4483 |
| us-east-2 | 0.080 | 1495 |
| us-gov-east-1 | 0.087 | 1641 |
| us-gov-west-1 | 0.326 | 192 |
| us-west-1 | 0.272 | 3396 |
| us-west-2 | 0.327 | 155 |

