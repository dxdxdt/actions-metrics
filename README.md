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
Updated: 2026-03-06T06:38:18.832816+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.956 |  |
| ap-east-1 | 0.730 |  |
| ap-east-2 | 0.667 |  |
| ap-northeast-1 | 0.559 |  |
| ap-northeast-2 | 0.662 |  |
| ap-northeast-3 | 0.573 |  |
| ap-south-1 | 0.873 |  |
| ap-south-2 | 0.909 |  |
| ap-southeast-1 | 0.803 |  |
| ap-southeast-2 | 0.725 |  |
| ap-southeast-3 | 0.865 |  |
| ap-southeast-4 | 0.757 |  |
| ap-southeast-5 | 0.825 |  |
| ap-southeast-6 | 0.753 |  |
| ap-southeast-7 | 0.915 |  |
| ca-central-1 | 0.176 | 16 |
| ca-west-1 | 0.225 |  |
| eu-central-1 | 0.466 |  |
| eu-central-2 | 0.478 |  |
| eu-north-1 | 0.503 |  |
| eu-south-1 | 0.482 |  |
| eu-south-2 | 0.499 |  |
| eu-west-1 | 0.377 |  |
| eu-west-2 | 0.422 |  |
| eu-west-3 | 0.445 |  |
| il-central-1 | 0.625 |  |
| me-central-1 | 0.845 |  |
| me-south-1 | 0.809 |  |
| mx-central-1 | 0.249 |  |
| sa-east-1 | 0.575 |  |
| us-east-1 | 0.134 | 4227 |
| us-east-2 | 0.143 | 1402 |
| us-gov-east-1 | 0.151 | 1532 |
| us-gov-west-1 | 0.213 | 173 |
| us-west-1 | 0.196 | 3181 |
| us-west-2 | 0.211 | 141 |

