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
Updated: 2026-07-11T04:58:04.499618+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.929 |  |
| ap-east-1 | 0.752 |  |
| ap-east-2 | 0.692 |  |
| ap-northeast-1 | 0.574 |  |
| ap-northeast-2 | 0.673 |  |
| ap-northeast-3 | 0.598 |  |
| ap-south-1 | 0.857 |  |
| ap-south-2 | 0.881 |  |
| ap-southeast-1 | 0.828 |  |
| ap-southeast-2 | 0.730 |  |
| ap-southeast-3 | 0.890 |  |
| ap-southeast-4 | 0.773 |  |
| ap-southeast-5 | 0.848 |  |
| ap-southeast-6 | 0.774 |  |
| ap-southeast-7 | 0.933 |  |
| ca-central-1 | 0.170 | 16 |
| ca-west-1 | 0.264 |  |
| eu-central-1 | 0.442 |  |
| eu-central-2 | 0.462 |  |
| eu-north-1 | 0.491 |  |
| eu-south-1 | 0.479 |  |
| eu-south-2 | 0.468 |  |
| eu-west-1 | 0.359 |  |
| eu-west-2 | 0.403 |  |
| eu-west-3 | 0.419 |  |
| il-central-1 | 0.593 |  |
| me-central-1 | 0.833 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.220 |  |
| sa-east-1 | 0.547 |  |
| us-east-1 | 0.110 | 4847 |
| us-east-2 | 0.130 | 1656 |
| us-gov-east-1 | 0.126 | 1735 |
| us-gov-west-1 | 0.253 | 202 |
| us-west-1 | 0.205 | 3764 |
| us-west-2 | 0.254 | 164 |

