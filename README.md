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
Updated: 2026-03-23T09:56:30.983175+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.904 |  |
| ap-east-1 | 0.791 |  |
| ap-east-2 | 0.727 |  |
| ap-northeast-1 | 0.603 |  |
| ap-northeast-2 | 0.712 |  |
| ap-northeast-3 | 0.637 |  |
| ap-south-1 | 0.873 |  |
| ap-south-2 | 0.907 |  |
| ap-southeast-1 | 0.857 |  |
| ap-southeast-2 | 0.774 |  |
| ap-southeast-3 | 0.908 |  |
| ap-southeast-4 | 0.819 |  |
| ap-southeast-5 | 0.873 |  |
| ap-southeast-6 | 0.859 |  |
| ap-southeast-7 | 0.966 |  |
| ca-central-1 | 0.120 | 16 |
| ca-west-1 | 0.259 |  |
| eu-central-1 | 0.417 |  |
| eu-central-2 | 0.430 |  |
| eu-north-1 | 0.467 |  |
| eu-south-1 | 0.438 |  |
| eu-south-2 | 0.447 |  |
| eu-west-1 | 0.335 |  |
| eu-west-2 | 0.374 |  |
| eu-west-3 | 0.399 |  |
| il-central-1 | 0.587 |  |
| me-central-1 | 0.792 |  |
| me-south-1 | 0.759 |  |
| mx-central-1 | 0.236 |  |
| sa-east-1 | 0.509 |  |
| us-east-1 | 0.075 | 4338 |
| us-east-2 | 0.091 | 1447 |
| us-gov-east-1 | 0.098 | 1596 |
| us-gov-west-1 | 0.292 | 189 |
| us-west-1 | 0.253 | 3285 |
| us-west-2 | 0.287 | 151 |

