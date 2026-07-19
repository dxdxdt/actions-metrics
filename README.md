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
Updated: 2026-07-19T11:50:23.385269+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.990 |  |
| ap-east-1 | 0.685 |  |
| ap-east-2 | 0.629 |  |
| ap-northeast-1 | 0.510 |  |
| ap-northeast-2 | 0.613 |  |
| ap-northeast-3 | 0.537 |  |
| ap-south-1 | 0.917 |  |
| ap-south-2 | 0.955 |  |
| ap-southeast-1 | 0.762 |  |
| ap-southeast-2 | 0.674 |  |
| ap-southeast-3 | 0.818 |  |
| ap-southeast-4 | 0.724 |  |
| ap-southeast-5 | 0.784 |  |
| ap-southeast-6 | 0.737 |  |
| ap-southeast-7 | 0.865 |  |
| ca-central-1 | 0.208 | 16 |
| ca-west-1 | 0.227 |  |
| eu-central-1 | 0.502 |  |
| eu-central-2 | 0.522 |  |
| eu-north-1 | 0.536 |  |
| eu-south-1 | 0.525 |  |
| eu-south-2 | 0.534 |  |
| eu-west-1 | 0.416 |  |
| eu-west-2 | 0.463 |  |
| eu-west-3 | 0.482 |  |
| il-central-1 | 0.649 |  |
| me-central-1 | 0.896 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.208 |  |
| sa-east-1 | 0.626 |  |
| us-east-1 | 0.174 | 4884 |
| us-east-2 | 0.171 | 1657 |
| us-gov-east-1 | 0.144 | 1770 |
| us-gov-west-1 | 0.190 | 204 |
| us-west-1 | 0.144 | 3802 |
| us-west-2 | 0.192 | 167 |

