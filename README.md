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
Updated: 2026-06-15T06:17:55.887079+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.964 |  |
| ap-east-1 | 0.720 |  |
| ap-east-2 | 0.653 |  |
| ap-northeast-1 | 0.540 |  |
| ap-northeast-2 | 0.653 |  |
| ap-northeast-3 | 0.569 |  |
| ap-south-1 | 0.915 |  |
| ap-south-2 | 0.927 |  |
| ap-southeast-1 | 0.786 |  |
| ap-southeast-2 | 0.693 |  |
| ap-southeast-3 | 0.845 |  |
| ap-southeast-4 | 0.735 |  |
| ap-southeast-5 | 0.815 |  |
| ap-southeast-6 | 0.718 |  |
| ap-southeast-7 | 0.905 |  |
| ca-central-1 | 0.181 | 16 |
| ca-west-1 | 0.255 |  |
| eu-central-1 | 0.487 |  |
| eu-central-2 | 0.509 |  |
| eu-north-1 | 0.537 |  |
| eu-south-1 | 0.516 |  |
| eu-south-2 | 0.526 |  |
| eu-west-1 | 0.409 |  |
| eu-west-2 | 0.447 |  |
| eu-west-3 | 0.469 |  |
| il-central-1 | 0.649 |  |
| me-central-1 | 0.870 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.196 |  |
| sa-east-1 | 0.594 |  |
| us-east-1 | 0.150 | 4759 |
| us-east-2 | 0.121 | 1634 |
| us-gov-east-1 | 0.129 | 1713 |
| us-gov-west-1 | 0.206 | 198 |
| us-west-1 | 0.152 | 3667 |
| us-west-2 | 0.210 | 163 |

