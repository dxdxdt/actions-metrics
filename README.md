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
Updated: 2026-03-28T09:30:09.591268+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.987 |  |
| ap-east-1 | 0.708 |  |
| ap-east-2 | 0.649 |  |
| ap-northeast-1 | 0.534 |  |
| ap-northeast-2 | 0.640 |  |
| ap-northeast-3 | 0.560 |  |
| ap-south-1 | 0.866 |  |
| ap-south-2 | 0.876 |  |
| ap-southeast-1 | 0.785 |  |
| ap-southeast-2 | 0.684 |  |
| ap-southeast-3 | 0.849 |  |
| ap-southeast-4 | 0.722 |  |
| ap-southeast-5 | 0.802 |  |
| ap-southeast-6 | 0.736 |  |
| ap-southeast-7 | 0.885 |  |
| ca-central-1 | 0.211 | 16 |
| ca-west-1 | 0.226 |  |
| eu-central-1 | 0.500 |  |
| eu-central-2 | 0.522 |  |
| eu-north-1 | 0.550 |  |
| eu-south-1 | 0.514 |  |
| eu-south-2 | 0.560 |  |
| eu-west-1 | 0.434 |  |
| eu-west-2 | 0.445 |  |
| eu-west-3 | 0.474 |  |
| il-central-1 | 0.685 |  |
| me-central-1 | 0.877 |  |
| me-south-1 | 0.824 |  |
| mx-central-1 | 0.251 |  |
| sa-east-1 | 0.603 |  |
| us-east-1 | 0.168 | 4376 |
| us-east-2 | 0.171 | 1459 |
| us-gov-east-1 | 0.169 | 1610 |
| us-gov-west-1 | 0.213 | 190 |
| us-west-1 | 0.150 | 3314 |
| us-west-2 | 0.199 | 152 |

