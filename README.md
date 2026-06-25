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
Updated: 2026-06-25T19:48:11.760549+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.996 |  |
| ap-east-1 | 0.691 |  |
| ap-east-2 | 0.624 |  |
| ap-northeast-1 | 0.508 |  |
| ap-northeast-2 | 0.614 |  |
| ap-northeast-3 | 0.535 |  |
| ap-south-1 | 0.906 |  |
| ap-south-2 | 0.899 |  |
| ap-southeast-1 | 0.767 |  |
| ap-southeast-2 | 0.670 |  |
| ap-southeast-3 | 0.829 |  |
| ap-southeast-4 | 0.712 |  |
| ap-southeast-5 | 0.794 |  |
| ap-southeast-6 | 0.702 |  |
| ap-southeast-7 | 0.869 |  |
| ca-central-1 | 0.242 | 16 |
| ca-west-1 | 0.239 |  |
| eu-central-1 | 0.527 |  |
| eu-central-2 | 0.540 |  |
| eu-north-1 | 0.568 |  |
| eu-south-1 | 0.547 |  |
| eu-south-2 | 0.537 |  |
| eu-west-1 | 0.432 |  |
| eu-west-2 | 0.471 |  |
| eu-west-3 | 0.488 |  |
| il-central-1 | 0.664 |  |
| me-central-1 | 0.891 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.254 |  |
| sa-east-1 | 0.611 |  |
| us-east-1 | 0.175 | 4788 |
| us-east-2 | 0.181 | 1640 |
| us-gov-east-1 | 0.178 | 1720 |
| us-gov-west-1 | 0.196 | 199 |
| us-west-1 | 0.139 | 3705 |
| us-west-2 | 0.195 | 163 |

