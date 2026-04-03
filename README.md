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
Updated: 2026-04-03T12:44:13.582719+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.989 |  |
| ap-east-1 | 0.722 |  |
| ap-east-2 | 0.664 |  |
| ap-northeast-1 | 0.551 |  |
| ap-northeast-2 | 0.651 |  |
| ap-northeast-3 | 0.568 |  |
| ap-south-1 | 0.891 |  |
| ap-south-2 | 0.899 |  |
| ap-southeast-1 | 0.796 |  |
| ap-southeast-2 | 0.700 |  |
| ap-southeast-3 | 0.851 |  |
| ap-southeast-4 | 0.739 |  |
| ap-southeast-5 | 0.815 |  |
| ap-southeast-6 | 0.777 |  |
| ap-southeast-7 | 0.914 |  |
| ca-central-1 | 0.176 | 16 |
| ca-west-1 | 0.221 |  |
| eu-central-1 | 0.486 |  |
| eu-central-2 | 0.518 |  |
| eu-north-1 | 0.568 |  |
| eu-south-1 | 0.532 |  |
| eu-south-2 | 0.530 |  |
| eu-west-1 | 0.420 |  |
| eu-west-2 | 0.450 |  |
| eu-west-3 | 0.478 |  |
| il-central-1 | 0.693 |  |
| me-central-1 | 0.848 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.227 |  |
| sa-east-1 | 0.593 |  |
| us-east-1 | 0.144 | 4424 |
| us-east-2 | 0.125 | 1476 |
| us-gov-east-1 | 0.125 | 1622 |
| us-gov-west-1 | 0.211 | 191 |
| us-west-1 | 0.151 | 3345 |
| us-west-2 | 0.210 | 153 |

