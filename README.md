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
Updated: 2026-05-23T16:56:03.797330+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.879 |  |
| ap-east-1 | 0.804 |  |
| ap-east-2 | 0.739 |  |
| ap-northeast-1 | 0.615 |  |
| ap-northeast-2 | 0.733 |  |
| ap-northeast-3 | 0.648 |  |
| ap-south-1 | 0.829 |  |
| ap-south-2 | 0.879 |  |
| ap-southeast-1 | 0.878 |  |
| ap-southeast-2 | 0.806 |  |
| ap-southeast-3 | 0.943 |  |
| ap-southeast-4 | 0.847 |  |
| ap-southeast-5 | 0.897 |  |
| ap-southeast-6 | 0.825 |  |
| ap-southeast-7 | 0.999 |  |
| ca-central-1 | 0.111 | 16 |
| ca-west-1 | 0.270 |  |
| eu-central-1 | 0.395 |  |
| eu-central-2 | 0.417 |  |
| eu-north-1 | 0.443 |  |
| eu-south-1 | 0.428 |  |
| eu-south-2 | 0.433 |  |
| eu-west-1 | 0.319 |  |
| eu-west-2 | 0.354 |  |
| eu-west-3 | 0.377 |  |
| il-central-1 | 0.552 |  |
| me-central-1 | 0.766 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.235 |  |
| sa-east-1 | 0.495 |  |
| us-east-1 | 0.062 | 4681 |
| us-east-2 | 0.092 | 1607 |
| us-gov-east-1 | 0.091 | 1703 |
| us-gov-west-1 | 0.309 | 195 |
| us-west-1 | 0.258 | 3589 |
| us-west-2 | 0.308 | 159 |

