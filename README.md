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
Updated: 2026-08-07T22:26:59.126176+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.954 |  |
| ap-east-1 | 0.709 |  |
| ap-east-2 | 0.648 |  |
| ap-northeast-1 | 0.532 |  |
| ap-northeast-2 | 0.635 |  |
| ap-northeast-3 | 0.557 |  |
| ap-south-1 | 0.857 |  |
| ap-south-2 | 0.930 |  |
| ap-southeast-1 | 0.783 |  |
| ap-southeast-2 | 0.706 |  |
| ap-southeast-3 | 0.839 |  |
| ap-southeast-4 | 0.748 |  |
| ap-southeast-5 | 0.802 |  |
| ap-southeast-6 | 0.747 |  |
| ap-southeast-7 | 0.884 |  |
| ca-central-1 | 0.173 | 18 |
| ca-west-1 | 0.213 |  |
| eu-central-1 | 0.461 |  |
| eu-central-2 | 0.480 |  |
| eu-north-1 | 0.512 |  |
| eu-south-1 | 0.494 |  |
| eu-south-2 | 0.520 |  |
| eu-west-1 | 0.390 |  |
| eu-west-2 | 0.415 |  |
| eu-west-3 | 0.447 |  |
| il-central-1 | 0.625 |  |
| me-central-1 | 0.835 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.218 |  |
| sa-east-1 | 0.601 |  |
| us-east-1 | 0.153 | 4953 |
| us-east-2 | 0.146 | 1675 |
| us-gov-east-1 | 0.123 | 1809 |
| us-gov-west-1 | 0.205 | 212 |
| us-west-1 | 0.180 | 3895 |
| us-west-2 | 0.208 | 172 |

