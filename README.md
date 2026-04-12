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
Updated: 2026-04-12T13:56:17.165381+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.976 |  |
| ap-east-1 | 0.716 |  |
| ap-east-2 | 0.652 |  |
| ap-northeast-1 | 0.537 |  |
| ap-northeast-2 | 0.644 |  |
| ap-northeast-3 | 0.562 |  |
| ap-south-1 | 0.934 |  |
| ap-south-2 | 0.961 |  |
| ap-southeast-1 | 0.787 |  |
| ap-southeast-2 | 0.696 |  |
| ap-southeast-3 | 0.845 |  |
| ap-southeast-4 | 0.747 |  |
| ap-southeast-5 | 0.813 |  |
| ap-southeast-6 | 0.778 |  |
| ap-southeast-7 | 0.890 |  |
| ca-central-1 | 0.190 | 16 |
| ca-west-1 | 0.268 |  |
| eu-central-1 | 0.484 |  |
| eu-central-2 | 0.502 |  |
| eu-north-1 | 0.527 |  |
| eu-south-1 | 0.510 |  |
| eu-south-2 | 0.515 |  |
| eu-west-1 | 0.403 |  |
| eu-west-2 | 0.444 |  |
| eu-west-3 | 0.472 |  |
| il-central-1 | 0.668 |  |
| me-central-1 | 0.849 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.208 |  |
| sa-east-1 | 0.595 |  |
| us-east-1 | 0.153 | 4487 |
| us-east-2 | 0.154 | 1496 |
| us-gov-east-1 | 0.136 | 1643 |
| us-gov-west-1 | 0.210 | 192 |
| us-west-1 | 0.156 | 3401 |
| us-west-2 | 0.214 | 155 |

