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
Updated: 2026-10-26T18:14:29.211501+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.979 |  |
| ap-east-1 | 0.693 |  |
| ap-east-2 | 0.631 |  |
| ap-northeast-1 | 0.513 |  |
| ap-northeast-2 | 0.614 |  |
| ap-northeast-3 | 0.539 |  |
| ap-south-1 | 0.904 |  |
| ap-south-2 | 0.951 |  |
| ap-southeast-1 | 0.771 |  |
| ap-southeast-2 | 0.671 |  |
| ap-southeast-3 | 0.828 |  |
| ap-southeast-4 | 0.749 |  |
| ap-southeast-5 | 0.788 |  |
| ap-southeast-6 | 0.736 |  |
| ap-southeast-7 | 0.869 |  |
| ca-central-1 | 0.204 | 18 |
| ca-west-1 | 0.240 |  |
| eu-central-1 | 0.499 |  |
| eu-central-2 | 0.517 |  |
| eu-north-1 | 0.539 |  |
| eu-south-1 | 0.521 |  |
| eu-south-2 | 0.504 |  |
| eu-west-1 | 0.424 |  |
| eu-west-2 | 0.454 |  |
| eu-west-3 | 0.472 |  |
| il-central-1 | 0.654 |  |
| me-central-1 | 0.854 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.218 |  |
| sa-east-1 | 0.606 |  |
| us-east-1 | 0.160 | 5161 |
| us-east-2 | 0.177 | 1711 |
| us-gov-east-1 | 0.161 | 1955 |
| us-gov-west-1 | 0.203 | 240 |
| us-west-1 | 0.141 | 4195 |
| us-west-2 | 0.201 | 195 |

