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
Updated: 2026-06-23T23:02:02.461862+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.012 |  |
| ap-east-1 | 0.657 |  |
| ap-east-2 | 0.595 |  |
| ap-northeast-1 | 0.476 |  |
| ap-northeast-2 | 0.580 |  |
| ap-northeast-3 | 0.502 |  |
| ap-south-1 | 0.912 |  |
| ap-south-2 | 0.897 |  |
| ap-southeast-1 | 0.736 |  |
| ap-southeast-2 | 0.635 |  |
| ap-southeast-3 | 0.799 |  |
| ap-southeast-4 | 0.679 |  |
| ap-southeast-5 | 0.754 |  |
| ap-southeast-6 | 0.671 |  |
| ap-southeast-7 | 0.838 |  |
| ca-central-1 | 0.267 | 16 |
| ca-west-1 | 0.242 |  |
| eu-central-1 | 0.539 |  |
| eu-central-2 | 0.578 |  |
| eu-north-1 | 0.578 |  |
| eu-south-1 | 0.580 |  |
| eu-south-2 | 0.569 |  |
| eu-west-1 | 0.453 |  |
| eu-west-2 | 0.501 |  |
| eu-west-3 | 0.512 |  |
| il-central-1 | 0.688 |  |
| me-central-1 | 0.929 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.255 |  |
| sa-east-1 | 0.643 |  |
| us-east-1 | 0.196 | 4785 |
| us-east-2 | 0.201 | 1638 |
| us-gov-east-1 | 0.186 | 1719 |
| us-gov-west-1 | 0.164 | 199 |
| us-west-1 | 0.108 | 3696 |
| us-west-2 | 0.163 | 163 |

