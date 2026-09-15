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
Updated: 2026-09-15T18:38:00.753924+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.917 |  |
| ap-east-1 | 0.754 |  |
| ap-east-2 | 0.695 |  |
| ap-northeast-1 | 0.573 |  |
| ap-northeast-2 | 0.688 |  |
| ap-northeast-3 | 0.598 |  |
| ap-south-1 | 0.865 |  |
| ap-south-2 | 0.897 |  |
| ap-southeast-1 | 0.854 |  |
| ap-southeast-2 | 0.724 |  |
| ap-southeast-3 | 0.886 |  |
| ap-southeast-4 | 0.770 |  |
| ap-southeast-5 | 0.850 |  |
| ap-southeast-6 | 0.765 |  |
| ap-southeast-7 | 0.940 |  |
| ca-central-1 | 0.148 | 18 |
| ca-west-1 | 0.245 |  |
| eu-central-1 | 0.445 |  |
| eu-central-2 | 0.462 |  |
| eu-north-1 | 0.496 |  |
| eu-south-1 | 0.474 |  |
| eu-south-2 | 0.489 |  |
| eu-west-1 | 0.373 |  |
| eu-west-2 | 0.407 |  |
| eu-west-3 | 0.425 |  |
| il-central-1 | 0.604 |  |
| me-central-1 | 0.844 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.231 |  |
| sa-east-1 | 0.545 |  |
| us-east-1 | 0.102 | 5101 |
| us-east-2 | 0.126 | 1686 |
| us-gov-east-1 | 0.120 | 1914 |
| us-gov-west-1 | 0.257 | 233 |
| us-west-1 | 0.194 | 4113 |
| us-west-2 | 0.255 | 192 |

