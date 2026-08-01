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
Updated: 2026-08-01T11:12:27.039728+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.010 |  |
| ap-east-1 | 0.670 |  |
| ap-east-2 | 0.609 |  |
| ap-northeast-1 | 0.493 |  |
| ap-northeast-2 | 0.599 |  |
| ap-northeast-3 | 0.517 |  |
| ap-south-1 | 0.881 |  |
| ap-south-2 | 0.865 |  |
| ap-southeast-1 | 0.747 |  |
| ap-southeast-2 | 0.633 |  |
| ap-southeast-3 | 0.802 |  |
| ap-southeast-4 | 0.678 |  |
| ap-southeast-5 | 0.765 |  |
| ap-southeast-6 | 0.683 |  |
| ap-southeast-7 | 0.852 |  |
| ca-central-1 | 0.267 | 17 |
| ca-west-1 | 0.196 |  |
| eu-central-1 | 0.525 |  |
| eu-central-2 | 0.549 |  |
| eu-north-1 | 0.566 |  |
| eu-south-1 | 0.556 |  |
| eu-south-2 | 0.564 |  |
| eu-west-1 | 0.451 |  |
| eu-west-2 | 0.482 |  |
| eu-west-3 | 0.508 |  |
| il-central-1 | 0.693 |  |
| me-central-1 | 0.909 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.253 |  |
| sa-east-1 | 0.646 |  |
| us-east-1 | 0.204 | 4928 |
| us-east-2 | 0.218 | 1673 |
| us-gov-east-1 | 0.199 | 1791 |
| us-gov-west-1 | 0.160 | 209 |
| us-west-1 | 0.109 | 3864 |
| us-west-2 | 0.161 | 172 |

