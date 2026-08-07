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
Updated: 2026-08-07T06:06:06.685811+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.944 |  |
| ap-east-1 | 0.726 |  |
| ap-east-2 | 0.666 |  |
| ap-northeast-1 | 0.548 |  |
| ap-northeast-2 | 0.654 |  |
| ap-northeast-3 | 0.573 |  |
| ap-south-1 | 0.916 |  |
| ap-south-2 | 0.981 |  |
| ap-southeast-1 | 0.803 |  |
| ap-southeast-2 | 0.722 |  |
| ap-southeast-3 | 0.857 |  |
| ap-southeast-4 | 0.763 |  |
| ap-southeast-5 | 0.823 |  |
| ap-southeast-6 | 0.770 |  |
| ap-southeast-7 | 0.908 |  |
| ca-central-1 | 0.167 | 18 |
| ca-west-1 | 0.257 |  |
| eu-central-1 | 0.451 |  |
| eu-central-2 | 0.481 |  |
| eu-north-1 | 0.491 |  |
| eu-south-1 | 0.479 |  |
| eu-south-2 | 0.495 |  |
| eu-west-1 | 0.403 |  |
| eu-west-2 | 0.419 |  |
| eu-west-3 | 0.446 |  |
| il-central-1 | 0.607 |  |
| me-central-1 | 0.859 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.214 |  |
| sa-east-1 | 0.582 |  |
| us-east-1 | 0.142 | 4949 |
| us-east-2 | 0.126 | 1674 |
| us-gov-east-1 | 0.113 | 1806 |
| us-gov-west-1 | 0.228 | 211 |
| us-west-1 | 0.178 | 3890 |
| us-west-2 | 0.230 | 172 |

