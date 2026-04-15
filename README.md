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
Updated: 2026-04-15T18:01:09.728263+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.988 |  |
| ap-east-1 | 0.711 |  |
| ap-east-2 | 0.681 |  |
| ap-northeast-1 | 0.540 |  |
| ap-northeast-2 | 0.631 |  |
| ap-northeast-3 | 0.574 |  |
| ap-south-1 | 0.890 |  |
| ap-south-2 | 0.941 |  |
| ap-southeast-1 | 0.797 |  |
| ap-southeast-2 | 0.689 |  |
| ap-southeast-3 | 0.849 |  |
| ap-southeast-4 | 0.730 |  |
| ap-southeast-5 | 0.818 |  |
| ap-southeast-6 | 0.716 |  |
| ap-southeast-7 | 0.899 |  |
| ca-central-1 | 0.184 | 16 |
| ca-west-1 | 0.208 |  |
| eu-central-1 | 0.514 |  |
| eu-central-2 | 0.524 |  |
| eu-north-1 | 0.555 |  |
| eu-south-1 | 0.536 |  |
| eu-south-2 | 0.546 |  |
| eu-west-1 | 0.436 |  |
| eu-west-2 | 0.466 |  |
| eu-west-3 | 0.487 |  |
| il-central-1 | 0.680 |  |
| me-central-1 | 0.877 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.233 |  |
| sa-east-1 | 0.615 |  |
| us-east-1 | 0.150 | 4506 |
| us-east-2 | 0.121 | 1501 |
| us-gov-east-1 | 0.125 | 1649 |
| us-gov-west-1 | 0.195 | 193 |
| us-west-1 | 0.158 | 3418 |
| us-west-2 | 0.193 | 156 |

