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
Updated: 2026-04-17T10:07:56.204001+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.951 |  |
| ap-east-1 | 0.750 |  |
| ap-east-2 | 0.713 |  |
| ap-northeast-1 | 0.579 |  |
| ap-northeast-2 | 0.687 |  |
| ap-northeast-3 | 0.599 |  |
| ap-south-1 | 0.898 |  |
| ap-south-2 | 0.980 |  |
| ap-southeast-1 | 0.827 |  |
| ap-southeast-2 | 0.732 |  |
| ap-southeast-3 | 0.923 |  |
| ap-southeast-4 | 0.779 |  |
| ap-southeast-5 | 0.850 |  |
| ap-southeast-6 | 0.808 |  |
| ap-southeast-7 | 0.935 |  |
| ca-central-1 | 0.138 | 16 |
| ca-west-1 | 0.252 |  |
| eu-central-1 | 0.457 |  |
| eu-central-2 | 0.465 |  |
| eu-north-1 | 0.508 |  |
| eu-south-1 | 0.482 |  |
| eu-south-2 | 0.493 |  |
| eu-west-1 | 0.379 |  |
| eu-west-2 | 0.417 |  |
| eu-west-3 | 0.432 |  |
| il-central-1 | 0.629 |  |
| me-central-1 | 0.942 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.206 |  |
| sa-east-1 | 0.561 |  |
| us-east-1 | 0.105 | 4514 |
| us-east-2 | 0.107 | 1507 |
| us-gov-east-1 | 0.107 | 1652 |
| us-gov-west-1 | 0.243 | 193 |
| us-west-1 | 0.198 | 3425 |
| us-west-2 | 0.244 | 156 |

