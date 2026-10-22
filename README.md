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
Updated: 2026-10-22T06:53:52.395453+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.996 |  |
| ap-east-1 | 0.682 |  |
| ap-east-2 | 0.614 |  |
| ap-northeast-1 | 0.553 |  |
| ap-northeast-2 | 0.613 |  |
| ap-northeast-3 | 0.525 |  |
| ap-south-1 | 0.904 |  |
| ap-south-2 | 0.922 |  |
| ap-southeast-1 | 0.756 |  |
| ap-southeast-2 | 0.639 |  |
| ap-southeast-3 | 0.812 |  |
| ap-southeast-4 | 0.723 |  |
| ap-southeast-5 | 0.774 |  |
| ap-southeast-6 | 0.714 |  |
| ap-southeast-7 | 0.856 |  |
| ca-central-1 | 0.229 | 18 |
| ca-west-1 | 0.278 |  |
| eu-central-1 | 0.524 |  |
| eu-central-2 | 0.543 |  |
| eu-north-1 | 0.573 |  |
| eu-south-1 | 0.553 |  |
| eu-south-2 | 0.537 |  |
| eu-west-1 | 0.442 |  |
| eu-west-2 | 0.474 |  |
| eu-west-3 | 0.498 |  |
| il-central-1 | 0.681 |  |
| me-central-1 | 0.900 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.225 |  |
| sa-east-1 | 0.631 |  |
| us-east-1 | 0.194 | 5158 |
| us-east-2 | 0.206 | 1704 |
| us-gov-east-1 | 0.194 | 1951 |
| us-gov-west-1 | 0.168 | 239 |
| us-west-1 | 0.111 | 4184 |
| us-west-2 | 0.168 | 195 |

