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
Updated: 2026-09-30T03:14:26.235847+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.910 |  |
| ap-east-1 | 0.749 |  |
| ap-east-2 | 0.682 |  |
| ap-northeast-1 | 0.567 |  |
| ap-northeast-2 | 0.659 |  |
| ap-northeast-3 | 0.592 |  |
| ap-south-1 | 0.851 |  |
| ap-south-2 | 0.874 |  |
| ap-southeast-1 | 0.853 |  |
| ap-southeast-2 | 0.721 |  |
| ap-southeast-3 | 0.881 |  |
| ap-southeast-4 | 0.771 |  |
| ap-southeast-5 | 0.851 |  |
| ap-southeast-6 | 0.775 |  |
| ap-southeast-7 | 0.931 |  |
| ca-central-1 | 0.154 | 18 |
| ca-west-1 | 0.288 |  |
| eu-central-1 | 0.428 |  |
| eu-central-2 | 0.462 |  |
| eu-north-1 | 0.487 |  |
| eu-south-1 | 0.466 |  |
| eu-south-2 | 0.502 |  |
| eu-west-1 | 0.358 |  |
| eu-west-2 | 0.396 |  |
| eu-west-3 | 0.409 |  |
| il-central-1 | 0.595 |  |
| me-central-1 | 0.830 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.229 |  |
| sa-east-1 | 0.538 |  |
| us-east-1 | 0.103 | 5130 |
| us-east-2 | 0.138 | 1687 |
| us-gov-east-1 | 0.150 | 1930 |
| us-gov-west-1 | 0.264 | 236 |
| us-west-1 | 0.197 | 4147 |
| us-west-2 | 0.263 | 192 |

