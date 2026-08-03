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
Updated: 2026-08-03T02:01:37.640531+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.958 |  |
| ap-east-1 | 0.711 |  |
| ap-east-2 | 0.647 |  |
| ap-northeast-1 | 0.530 |  |
| ap-northeast-2 | 0.633 |  |
| ap-northeast-3 | 0.548 |  |
| ap-south-1 | 0.877 |  |
| ap-south-2 | 0.880 |  |
| ap-southeast-1 | 0.788 |  |
| ap-southeast-2 | 0.692 |  |
| ap-southeast-3 | 0.847 |  |
| ap-southeast-4 | 0.791 |  |
| ap-southeast-5 | 0.808 |  |
| ap-southeast-6 | 0.732 |  |
| ap-southeast-7 | 0.891 |  |
| ca-central-1 | 0.226 | 17 |
| ca-west-1 | 0.246 |  |
| eu-central-1 | 0.478 |  |
| eu-central-2 | 0.507 |  |
| eu-north-1 | 0.526 |  |
| eu-south-1 | 0.521 |  |
| eu-south-2 | 0.512 |  |
| eu-west-1 | 0.417 |  |
| eu-west-2 | 0.441 |  |
| eu-west-3 | 0.460 |  |
| il-central-1 | 0.639 |  |
| me-central-1 | 0.890 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.215 |  |
| sa-east-1 | 0.587 |  |
| us-east-1 | 0.153 | 4935 |
| us-east-2 | 0.190 | 1673 |
| us-gov-east-1 | 0.184 | 1798 |
| us-gov-west-1 | 0.215 | 209 |
| us-west-1 | 0.153 | 3876 |
| us-west-2 | 0.216 | 172 |

