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
Updated: 2026-08-02T13:03:12.039802+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.037 |  |
| ap-east-1 | 0.646 |  |
| ap-east-2 | 0.586 |  |
| ap-northeast-1 | 0.469 |  |
| ap-northeast-2 | 0.575 |  |
| ap-northeast-3 | 0.495 |  |
| ap-south-1 | 0.898 |  |
| ap-south-2 | 0.876 |  |
| ap-southeast-1 | 0.721 |  |
| ap-southeast-2 | 0.603 |  |
| ap-southeast-3 | 0.780 |  |
| ap-southeast-4 | 0.643 |  |
| ap-southeast-5 | 0.742 |  |
| ap-southeast-6 | 0.654 |  |
| ap-southeast-7 | 0.825 |  |
| ca-central-1 | 0.298 | 17 |
| ca-west-1 | 0.187 |  |
| eu-central-1 | 0.554 |  |
| eu-central-2 | 0.577 |  |
| eu-north-1 | 0.602 |  |
| eu-south-1 | 0.585 |  |
| eu-south-2 | 0.590 |  |
| eu-west-1 | 0.482 |  |
| eu-west-2 | 0.520 |  |
| eu-west-3 | 0.540 |  |
| il-central-1 | 0.718 |  |
| me-central-1 | 0.927 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.241 |  |
| sa-east-1 | 0.679 |  |
| us-east-1 | 0.237 | 4932 |
| us-east-2 | 0.241 | 1673 |
| us-gov-east-1 | 0.247 | 1796 |
| us-gov-west-1 | 0.126 | 209 |
| us-west-1 | 0.072 | 3871 |
| us-west-2 | 0.126 | 172 |

