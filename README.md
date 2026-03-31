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
Updated: 2026-03-31T18:51:36.555048+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.872 |  |
| ap-east-1 | 0.812 |  |
| ap-east-2 | 0.750 |  |
| ap-northeast-1 | 0.629 |  |
| ap-northeast-2 | 0.754 |  |
| ap-northeast-3 | 0.657 |  |
| ap-south-1 | 0.832 |  |
| ap-south-2 | 0.882 |  |
| ap-southeast-1 | 0.883 |  |
| ap-southeast-2 | 0.804 |  |
| ap-southeast-3 | 0.940 |  |
| ap-southeast-4 | 0.849 |  |
| ap-southeast-5 | 0.905 |  |
| ap-southeast-6 | 0.855 |  |
| ap-southeast-7 | 0.982 |  |
| ca-central-1 | 0.102 | 16 |
| ca-west-1 | 0.290 |  |
| eu-central-1 | 0.389 |  |
| eu-central-2 | 0.400 |  |
| eu-north-1 | 0.437 |  |
| eu-south-1 | 0.414 |  |
| eu-south-2 | 0.423 |  |
| eu-west-1 | 0.299 |  |
| eu-west-2 | 0.346 |  |
| eu-west-3 | 0.370 |  |
| il-central-1 | 0.566 |  |
| me-central-1 | 0.762 |  |
| me-south-1 | 0.729 |  |
| mx-central-1 | 0.242 |  |
| sa-east-1 | 0.485 |  |
| us-east-1 | 0.051 | 4409 |
| us-east-2 | 0.089 | 1469 |
| us-gov-east-1 | 0.088 | 1618 |
| us-gov-west-1 | 0.308 | 190 |
| us-west-1 | 0.265 | 3325 |
| us-west-2 | 0.328 | 152 |

