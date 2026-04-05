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
Updated: 2026-04-05T06:11:20.190928+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.903 |  |
| ap-east-1 | 0.776 |  |
| ap-east-2 | 0.712 |  |
| ap-northeast-1 | 0.595 |  |
| ap-northeast-2 | 0.706 |  |
| ap-northeast-3 | 0.620 |  |
| ap-south-1 | 0.842 |  |
| ap-south-2 | 0.887 |  |
| ap-southeast-1 | 0.855 |  |
| ap-southeast-2 | 0.763 |  |
| ap-southeast-3 | 0.913 |  |
| ap-southeast-4 | 0.803 |  |
| ap-southeast-5 | 0.875 |  |
| ap-southeast-6 | 0.789 |  |
| ap-southeast-7 | 0.959 |  |
| ca-central-1 | 0.132 | 16 |
| ca-west-1 | 0.280 |  |
| eu-central-1 | 0.409 |  |
| eu-central-2 | 0.433 |  |
| eu-north-1 | 0.470 |  |
| eu-south-1 | 0.446 |  |
| eu-south-2 | 0.445 |  |
| eu-west-1 | 0.336 |  |
| eu-west-2 | 0.373 |  |
| eu-west-3 | 0.393 |  |
| il-central-1 | 0.619 |  |
| me-central-1 | 0.788 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.242 |  |
| sa-east-1 | 0.514 |  |
| us-east-1 | 0.085 | 4436 |
| us-east-2 | 0.114 | 1482 |
| us-gov-east-1 | 0.111 | 1628 |
| us-gov-west-1 | 0.276 | 191 |
| us-west-1 | 0.228 | 3356 |
| us-west-2 | 0.287 | 153 |

