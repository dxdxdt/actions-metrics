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
Updated: 2026-02-15T05:51:56.901071+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.043 |  |
| ap-east-1 | 0.659 |  |
| ap-east-2 | 0.603 |  |
| ap-northeast-1 | 0.484 |  |
| ap-northeast-2 | 0.590 |  |
| ap-south-1 | 0.919 |  |
| ap-south-2 | 0.929 |  |
| ap-southeast-1 | 0.736 |  |
| ap-southeast-2 | 0.629 |  |
| ap-southeast-3 | 0.791 |  |
| ap-southeast-4 | 0.671 |  |
| ap-southeast-5 | 0.756 |  |
| ap-southeast-6 | 0.695 |  |
| ap-southeast-7 | 0.838 |  |
| ca-central-1 | 0.250 | 16 |
| ca-west-1 | 0.186 |  |
| eu-central-1 | 0.555 |  |
| eu-central-2 | 0.580 |  |
| eu-north-1 | 0.591 |  |
| eu-south-1 | 0.572 |  |
| eu-south-2 | 0.591 |  |
| eu-west-1 | 0.463 |  |
| eu-west-2 | 0.513 |  |
| eu-west-3 | 0.535 |  |
| il-central-1 | 0.734 |  |
| me-central-1 | 0.922 |  |
| me-south-1 | 0.889 |  |
| mx-central-1 | 0.223 |  |
| sa-east-1 | 0.661 |  |
| us-east-1 | 0.207 | 4122 |
| us-east-2 | 0.182 | 1341 |
| us-gov-east-1 | 0.177 | 1470 |
| us-gov-west-1 | 0.139 | 148 |
| us-west-1 | 0.121 | 3061 |
| us-west-2 | 0.139 | 125 |

