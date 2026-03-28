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
Updated: 2026-03-28T07:40:46.211673+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.898 |  |
| ap-east-1 | 0.783 |  |
| ap-east-2 | 0.736 |  |
| ap-northeast-1 | 0.625 |  |
| ap-northeast-2 | 0.724 |  |
| ap-northeast-3 | 0.647 |  |
| ap-south-1 | 0.841 |  |
| ap-south-2 | 0.898 |  |
| ap-southeast-1 | 0.874 |  |
| ap-southeast-2 | 0.797 |  |
| ap-southeast-3 | 0.930 |  |
| ap-southeast-4 | 0.841 |  |
| ap-southeast-5 | 0.896 |  |
| ap-southeast-6 | 0.842 |  |
| ap-southeast-7 | 0.969 |  |
| ca-central-1 | 0.122 | 16 |
| ca-west-1 | 0.260 |  |
| eu-central-1 | 0.407 |  |
| eu-central-2 | 0.423 |  |
| eu-north-1 | 0.463 |  |
| eu-south-1 | 0.427 |  |
| eu-south-2 | 0.472 |  |
| eu-west-1 | 0.326 |  |
| eu-west-2 | 0.362 |  |
| eu-west-3 | 0.391 |  |
| il-central-1 | 0.592 |  |
| me-central-1 | 0.784 |  |
| me-south-1 | 0.738 |  |
| mx-central-1 | 0.251 |  |
| sa-east-1 | 0.505 |  |
| us-east-1 | 0.072 | 4375 |
| us-east-2 | 0.092 | 1459 |
| us-gov-east-1 | 0.101 | 1610 |
| us-gov-west-1 | 0.314 | 190 |
| us-west-1 | 0.256 | 3313 |
| us-west-2 | 0.297 | 152 |

