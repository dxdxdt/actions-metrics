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
Updated: 2026-07-14T09:49:18.795496+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.954 |  |
| ap-east-1 | 0.718 |  |
| ap-east-2 | 0.662 |  |
| ap-northeast-1 | 0.541 |  |
| ap-northeast-2 | 0.643 |  |
| ap-northeast-3 | 0.567 |  |
| ap-south-1 | 0.922 |  |
| ap-south-2 | 0.993 |  |
| ap-southeast-1 | 0.794 |  |
| ap-southeast-2 | 0.698 |  |
| ap-southeast-3 | 0.847 |  |
| ap-southeast-4 | 0.742 |  |
| ap-southeast-5 | 0.814 |  |
| ap-southeast-6 | 0.724 |  |
| ap-southeast-7 | 0.895 |  |
| ca-central-1 | 0.148 | 16 |
| ca-west-1 | 0.206 |  |
| eu-central-1 | 0.473 |  |
| eu-central-2 | 0.506 |  |
| eu-north-1 | 0.516 |  |
| eu-south-1 | 0.523 |  |
| eu-south-2 | 0.514 |  |
| eu-west-1 | 0.405 |  |
| eu-west-2 | 0.452 |  |
| eu-west-3 | 0.462 |  |
| il-central-1 | 0.636 |  |
| me-central-1 | 0.841 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.186 |  |
| sa-east-1 | 0.616 |  |
| us-east-1 | 0.121 | 4868 |
| us-east-2 | 0.122 | 1656 |
| us-gov-east-1 | 0.089 | 1747 |
| us-gov-west-1 | 0.215 | 202 |
| us-west-1 | 0.159 | 3775 |
| us-west-2 | 0.214 | 165 |

