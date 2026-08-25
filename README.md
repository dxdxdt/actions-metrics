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
Updated: 2026-08-25T04:31:31.914372+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.873 |  |
| ap-east-1 | 0.796 |  |
| ap-east-2 | 0.730 |  |
| ap-northeast-1 | 0.612 |  |
| ap-northeast-2 | 0.719 |  |
| ap-northeast-3 | 0.638 |  |
| ap-south-1 | 0.827 |  |
| ap-south-2 | 0.931 |  |
| ap-southeast-1 | 0.871 |  |
| ap-southeast-2 | 0.774 |  |
| ap-southeast-3 | 0.922 |  |
| ap-southeast-4 | 0.815 |  |
| ap-southeast-5 | 0.897 |  |
| ap-southeast-6 | 0.802 |  |
| ap-southeast-7 | 0.983 |  |
| ca-central-1 | 0.120 | 18 |
| ca-west-1 | 0.274 |  |
| eu-central-1 | 0.393 |  |
| eu-central-2 | 0.421 |  |
| eu-north-1 | 0.457 |  |
| eu-south-1 | 0.413 |  |
| eu-south-2 | 0.421 |  |
| eu-west-1 | 0.321 |  |
| eu-west-2 | 0.346 |  |
| eu-west-3 | 0.369 |  |
| il-central-1 | 0.547 |  |
| me-central-1 | 0.758 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.256 |  |
| sa-east-1 | 0.493 |  |
| us-east-1 | 0.064 | 5058 |
| us-east-2 | 0.080 | 1684 |
| us-gov-east-1 | 0.104 | 1881 |
| us-gov-west-1 | 0.296 | 227 |
| us-west-1 | 0.242 | 4049 |
| us-west-2 | 0.301 | 186 |

